# TODO: REMOVE ME
# Most of this class now lives in Gherkin's i18n.rb
module Cucumber
  module Parser
    class NaturalLanguage
      KEYWORD_KEYS = %w{name native feature background scenario scenario_outline examples given when then and but}

      class << self
        def get(step_mother, lang)
          languages[lang] ||= new(step_mother, lang)
        end

        def languages
          @languages ||= {}
        end

        # Used by code generators for other lexer tools like pygments lexer and textmate bundle
        def all(step_mother=nil)
          Cucumber::LANGUAGES.keys.sort.map{|lang| get(step_mother, lang)}
        end
      end

      def initialize(step_mother, lang)
        @keywords = Cucumber::LANGUAGES[lang]
        raise "Language not supported: #{lang.inspect}" if @keywords.nil?
        @keywords['grammar_name'] = @keywords['name'].gsub(/\s/, '')
        register_adverbs(step_mother) if step_mother
        @parser = nil
      end

      def register_adverbs(step_mother)
        adverbs = %w{given when then and but}.map{|keyword| @keywords[keyword].split('|').map{|w| w.gsub(/[\s<']/, '')}}.flatten
        step_mother.register_adverbs(adverbs) if step_mother
      end

      def parser
        return @parser if @parser
        i18n_tt = File.expand_path(File.dirname(__FILE__) + '/i18n.tt')
        template = File.open(i18n_tt, Cucumber.file_mode('r')).read
        erb = ERB.new(template)
        grammar = erb.result(binding)

        # The Rails 2-3-stable branch has decided to monkey-patch ERB so that ERB#result
        # returns a subclass of String (SafeBuffer). This class will escape '&',  '>',  '<' and '"',
        # effectively breaking any other library that relies on ERB behavig the way it _should_.
        # This is a workaround hack until this has been fixed in Rails.
        grammar = "" + grammar # Make SafeBuffer a String again.

        Treetop.load_from_string(grammar)
        @parser = Parser::I18n.const_get("#{@keywords['grammar_name']}Parser").new
        def @parser.inspect
          "#<#{self.class.name}>"
        end
        @parser
      end

      def parse(source, path, lines, name_regexen, tag_expression)
        feature = parser.parse_or_fail(source, path, lines, name_regexen, tag_expression, 0)
        feature.language = self if feature
        feature
      end

      def incomplete?
        KEYWORD_KEYS.detect{|key| @keywords[key].nil?}
      end

      def feature_keywords
        keywords('feature')
      end

      def scenario_keywords
        keywords('scenario')
      end

      def scenario_outline_keywords
        keywords('scenario_outline')
      end

      def background_keywords
        keywords('background')
      end

      def examples_keywords
        keywords('examples')
      end

      def but_keywords(space=true)
        keywords('but', space)
      end

      def and_keywords(space=true)
        keywords('and', space)
      end

      def given_keyword
        keywords('given', false)[1] # The 0th one is a '*', which we don't want
      end

      def step_keywords
        %w{given when then and but}.map{|key| keywords(key, true)}.flatten.uniq
      end

      def keywords(key, space=false)
        raise "No #{key} in #{@keywords.inspect}" if @keywords[key].nil?
        @keywords[key].split('|').map{|kw| space ? keyword_space(kw) : kw}.uniq
      end

      private

      def treetop_keywords(keywords)
        "(" + keywords.map{|k| %{"#{k}"}}.join(" / ") + ")"
      end

      def keyword_space(val)
        (val + ' ').sub(/< $/,'')
      end
    end
  end
end
