# Autogenerated from a Treetop grammar. Edits may be lost.


require 'cucumber/ast/tags'

module Cucumber
  module Parser
    # TIP: When you hack on the grammar, just delete feature.rb in this directory.
    # Also make sure you have uninstalled all cucumber gems (don't forget xxx-cucumber
    # github gems).
    #
    # Treetop will then generate the parser in-memory. When you're happy, just generate
    # the rb file with tt feature.tt
    module Feature
      include Treetop::Runtime

      def root
        @root || :feature_sub
      end

      module FeatureSub0
      end

      module FeatureSub1
        def white1
          elements[0]
        end

        def comment
          elements[1]
        end

        def white2
          elements[2]
        end

        def tags
          elements[3]
        end

        def white3
          elements[4]
        end

        def header
          elements[5]
        end

        def bg
          elements[6]
        end

        def feature_elements
          elements[7]
        end

      end

      module FeatureSub2
        def emit(listener)
          comment.emit(listener)
          tags.emit(listener)
          listener.feature('', header.text_value, header.line)
          bg.emit(listener) if bg.respond_to?(:emit)
          feature_elements.emit(listener)
        end
      end

      def _nt_feature_sub
        start_index = index
        if node_cache[:feature_sub].has_key?(index)
          cached = node_cache[:feature_sub][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_white
        s0 << r1
        if r1
          r2 = _nt_comment
          s0 << r2
          if r2
            r3 = _nt_white
            s0 << r3
            if r3
              r4 = _nt_tags
              s0 << r4
              if r4
                r5 = _nt_white
                s0 << r5
                if r5
                  s6, i6 = [], index
                  loop do
                    i7, s7 = index, []
                    i8 = index
                    i9 = index
                    r10 = _nt_scenario_outline
                    if r10
                      r9 = r10
                    else
                      r11 = _nt_scenario
                      if r11
                        r9 = r11
                      else
                        r12 = _nt_background
                        if r12
                          r9 = r12
                        else
                          @index = i9
                          r9 = nil
                        end
                      end
                    end
                    if r9
                      r8 = nil
                    else
                      @index = i8
                      r8 = instantiate_node(SyntaxNode,input, index...index)
                    end
                    s7 << r8
                    if r8
                      if index < input_length
                        r13 = instantiate_node(SyntaxNode,input, index...(index + 1))
                        @index += 1
                      else
                        terminal_parse_failure("any character")
                        r13 = nil
                      end
                      s7 << r13
                    end
                    if s7.last
                      r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
                      r7.extend(FeatureSub0)
                    else
                      @index = i7
                      r7 = nil
                    end
                    if r7
                      s6 << r7
                    else
                      break
                    end
                  end
                  r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
                  s0 << r6
                  if r6
                    r15 = _nt_background
                    if r15
                      r14 = r15
                    else
                      r14 = instantiate_node(SyntaxNode,input, index...index)
                    end
                    s0 << r14
                    if r14
                      r16 = _nt_feature_elements
                      s0 << r16
                      if r16
                        r18 = _nt_comment
                        if r18
                          r17 = r18
                        else
                          r17 = instantiate_node(SyntaxNode,input, index...index)
                        end
                        s0 << r17
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(FeatureSub1)
          r0.extend(FeatureSub2)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:feature_sub][start_index] = r0

        r0
      end

      module Tags0
        def tag
          elements[0]
        end

      end

      module Tags1
        def white
          elements[0]
        end

        def ts
          elements[1]
        end
      end

      module Tags2
        def tag_names
          @tag_names ||= ts.elements.map{|e| e.tag.text_value}
        end

        def emit(listener)
          ts.elements.each{|e| listener.tag(e.tag.text_value, e.tag.line)}
        end
      end

      def _nt_tags
        start_index = index
        if node_cache[:tags].has_key?(index)
          cached = node_cache[:tags][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_white
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            i3, s3 = index, []
            r4 = _nt_tag
            s3 << r4
            if r4
              s5, i5 = [], index
              loop do
                i6 = index
                r7 = _nt_space
                if r7
                  r6 = r7
                else
                  r8 = _nt_eol
                  if r8
                    r6 = r8
                  else
                    @index = i6
                    r6 = nil
                  end
                end
                if r6
                  s5 << r6
                else
                  break
                end
              end
              if s5.empty?
                @index = i5
                r5 = nil
              else
                r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
              end
              s3 << r5
            end
            if s3.last
              r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
              r3.extend(Tags0)
            else
              @index = i3
              r3 = nil
            end
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
          s0 << r2
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(Tags1)
          r0.extend(Tags2)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:tags][start_index] = r0

        r0
      end

      module Tag0
      end

      def _nt_tag
        start_index = index
        if node_cache[:tag].has_key?(index)
          cached = node_cache[:tag][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        if has_terminal?('@', false, index)
          r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('@')
          r1 = nil
        end
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            if has_terminal?('\G[^@\\r\\n\\t ]', true, index)
              r3 = true
              @index += 1
            else
              r3 = nil
            end
            if r3
              s2 << r3
            else
              break
            end
          end
          if s2.empty?
            @index = i2
            r2 = nil
          else
            r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
          end
          s0 << r2
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(Tag0)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:tag][start_index] = r0

        r0
      end

      module Comment0
        def comment_line
          elements[0]
        end

        def white
          elements[1]
        end
      end

      module Comment1
        def emit(listener)
          listener.comment(text_value, line)
        end
      end

      def _nt_comment
        start_index = index
        if node_cache[:comment].has_key?(index)
          cached = node_cache[:comment][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          i1, s1 = index, []
          r2 = _nt_comment_line
          s1 << r2
          if r2
            r3 = _nt_white
            s1 << r3
          end
          if s1.last
            r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
            r1.extend(Comment0)
          else
            @index = i1
            r1 = nil
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Comment1)

        node_cache[:comment][start_index] = r0

        r0
      end

      module CommentLine0
        def line_to_eol
          elements[2]
        end
      end

      def _nt_comment_line
        start_index = index
        if node_cache[:comment_line].has_key?(index)
          cached = node_cache[:comment_line][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        s1, i1 = [], index
        loop do
          r2 = _nt_space
          if r2
            s1 << r2
          else
            break
          end
        end
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        s0 << r1
        if r1
          if has_terminal?('#', false, index)
            r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('#')
            r3 = nil
          end
          s0 << r3
          if r3
            r4 = _nt_line_to_eol
            s0 << r4
          end
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(CommentLine0)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:comment_line][start_index] = r0

        r0
      end

      module Background0
        def comment
          elements[0]
        end

        def white
          elements[1]
        end

        def background_keyword
          elements[2]
        end

        def name
          elements[4]
        end

        def steps
          elements[6]
        end
      end

      module Background1
        def emit(listener)
          listener.background(background_keyword.text_value, name.build, background_keyword.line)
          steps.emit(listener)
        end
      end

      def _nt_background
        start_index = index
        if node_cache[:background].has_key?(index)
          cached = node_cache[:background][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_comment
        s0 << r1
        if r1
          r2 = _nt_white
          s0 << r2
          if r2
            r3 = _nt_background_keyword
            s0 << r3
            if r3
              s4, i4 = [], index
              loop do
                r5 = _nt_space
                if r5
                  s4 << r5
                else
                  break
                end
              end
              r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
              s0 << r4
              if r4
                r7 = _nt_lines_to_keyword
                if r7
                  r6 = r7
                else
                  r6 = instantiate_node(SyntaxNode,input, index...index)
                end
                s0 << r6
                if r6
                  i8 = index
                  s9, i9 = [], index
                  loop do
                    r10 = _nt_eol
                    if r10
                      s9 << r10
                    else
                      break
                    end
                  end
                  if s9.empty?
                    @index = i9
                    r9 = nil
                  else
                    r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
                  end
                  if r9
                    r8 = r9
                  else
                    r11 = _nt_eof
                    if r11
                      r8 = r11
                    else
                      @index = i8
                      r8 = nil
                    end
                  end
                  s0 << r8
                  if r8
                    r12 = _nt_steps
                    s0 << r12
                  end
                end
              end
            end
          end
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(Background0)
          r0.extend(Background1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:background][start_index] = r0

        r0
      end

      module FeatureElements0
        def emit(listener)
          elements.each do |feature_element|
            feature_element.emit(listener)
          end
        end
      end

      def _nt_feature_elements
        start_index = index
        if node_cache[:feature_elements].has_key?(index)
          cached = node_cache[:feature_elements][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          i1 = index
          r2 = _nt_scenario
          if r2
            r1 = r2
          else
            r3 = _nt_scenario_outline
            if r3
              r1 = r3
            else
              @index = i1
              r1 = nil
            end
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(FeatureElements0)

        node_cache[:feature_elements][start_index] = r0

        r0
      end

      module Scenario0
        def comment
          elements[0]
        end

        def tags
          elements[1]
        end

        def white1
          elements[2]
        end

        def scenario_keyword
          elements[3]
        end

        def name
          elements[5]
        end

        def white2
          elements[6]
        end

        def steps
          elements[7]
        end

        def white3
          elements[8]
        end
      end

      module Scenario1
        def emit(listener)
          comment.emit(listener)
          tags.emit(listener)
          listener.scenario(scenario_keyword.text_value, name.build, scenario_keyword.line)
          steps.emit(listener)
        end
      end

      def _nt_scenario
        start_index = index
        if node_cache[:scenario].has_key?(index)
          cached = node_cache[:scenario][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_comment
        s0 << r1
        if r1
          r2 = _nt_tags
          s0 << r2
          if r2
            r3 = _nt_white
            s0 << r3
            if r3
              r4 = _nt_scenario_keyword
              s0 << r4
              if r4
                s5, i5 = [], index
                loop do
                  r6 = _nt_space
                  if r6
                    s5 << r6
                  else
                    break
                  end
                end
                r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
                s0 << r5
                if r5
                  r7 = _nt_lines_to_keyword
                  s0 << r7
                  if r7
                    r8 = _nt_white
                    s0 << r8
                    if r8
                      r9 = _nt_steps
                      s0 << r9
                      if r9
                        r10 = _nt_white
                        s0 << r10
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(Scenario0)
          r0.extend(Scenario1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:scenario][start_index] = r0

        r0
      end

      module ScenarioOutline0
        def comment
          elements[0]
        end

        def tags
          elements[1]
        end

        def white1
          elements[2]
        end

        def scenario_outline_keyword
          elements[3]
        end

        def name
          elements[5]
        end

        def white2
          elements[6]
        end

        def steps
          elements[7]
        end

        def examples_sections
          elements[8]
        end

        def white3
          elements[9]
        end
      end

      module ScenarioOutline1
        def emit(listener)
          comment.emit(listener)
          tags.emit(listener)
          listener.scenario_outline(scenario_outline_keyword.text_value, name.build, scenario_outline_keyword.line)
          steps.emit(listener)
          examples_sections.emit(listener, self)
        end
      end

      def _nt_scenario_outline
        start_index = index
        if node_cache[:scenario_outline].has_key?(index)
          cached = node_cache[:scenario_outline][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_comment
        s0 << r1
        if r1
          r2 = _nt_tags
          s0 << r2
          if r2
            r3 = _nt_white
            s0 << r3
            if r3
              r4 = _nt_scenario_outline_keyword
              s0 << r4
              if r4
                s5, i5 = [], index
                loop do
                  r6 = _nt_space
                  if r6
                    s5 << r6
                  else
                    break
                  end
                end
                r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
                s0 << r5
                if r5
                  r7 = _nt_lines_to_keyword
                  s0 << r7
                  if r7
                    r8 = _nt_white
                    s0 << r8
                    if r8
                      r9 = _nt_steps
                      s0 << r9
                      if r9
                        r10 = _nt_examples_sections
                        s0 << r10
                        if r10
                          r11 = _nt_white
                          s0 << r11
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(ScenarioOutline0)
          r0.extend(ScenarioOutline1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:scenario_outline][start_index] = r0

        r0
      end

      module Steps0
        def emit(listener)
          elements.each{|e| e.emit(listener)}
        end
      end

      def _nt_steps
        start_index = index
        if node_cache[:steps].has_key?(index)
          cached = node_cache[:steps][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          r1 = _nt_step
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Steps0)

        node_cache[:steps][start_index] = r0

        r0
      end

      module Step0
        def comment
          elements[0]
        end

        def step_keyword
          elements[2]
        end

        def name
          elements[4]
        end

        def multi
          elements[6]
        end

        def white
          elements[7]
        end
      end

      module Step1
        def emit(listener)
          listener.step(step_keyword.text_value.strip, name.text_value.strip, step_keyword.line)
          multi.emit(listener) if multi.respond_to?(:emit)
        end
      end

      def _nt_step
        start_index = index
        if node_cache[:step].has_key?(index)
          cached = node_cache[:step][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_comment
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            r3 = _nt_space
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
          s0 << r2
          if r2
            r4 = _nt_step_keyword
            s0 << r4
            if r4
              s5, i5 = [], index
              loop do
                r6 = _nt_space
                if r6
                  s5 << r6
                else
                  break
                end
              end
              r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
              s0 << r5
              if r5
                r7 = _nt_line_to_eol
                s0 << r7
                if r7
                  i8 = index
                  s9, i9 = [], index
                  loop do
                    r10 = _nt_eol
                    if r10
                      s9 << r10
                    else
                      break
                    end
                  end
                  if s9.empty?
                    @index = i9
                    r9 = nil
                  else
                    r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
                  end
                  if r9
                    r8 = r9
                  else
                    r11 = _nt_eof
                    if r11
                      r8 = r11
                    else
                      @index = i8
                      r8 = nil
                    end
                  end
                  s0 << r8
                  if r8
                    r13 = _nt_multiline_arg
                    if r13
                      r12 = r13
                    else
                      r12 = instantiate_node(SyntaxNode,input, index...index)
                    end
                    s0 << r12
                    if r12
                      r14 = _nt_white
                      s0 << r14
                    end
                  end
                end
              end
            end
          end
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(Step0)
          r0.extend(Step1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:step][start_index] = r0

        r0
      end

      module ExamplesSections0
        def emit(listener, scenario_outline)
          elements.each do |e|
            e.emit(listener, scenario_outline)
          end
        end
      end

      def _nt_examples_sections
        start_index = index
        if node_cache[:examples_sections].has_key?(index)
          cached = node_cache[:examples_sections][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          r1 = _nt_examples
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ExamplesSections0)

        node_cache[:examples_sections][start_index] = r0

        r0
      end

      module Examples0
        def comment
          elements[0]
        end

        def examples_keyword
          elements[2]
        end

        def name
          elements[4]
        end

        def eol
          elements[5]
        end

        def table
          elements[6]
        end

        def white
          elements[7]
        end
      end

      module Examples1
        def emit(listener, scenario_outline)
          listener.examples(examples_keyword.text_value, name.build, examples_keyword.line)
          table.emit(listener, scenario_outline)
        end
      end

      def _nt_examples
        start_index = index
        if node_cache[:examples].has_key?(index)
          cached = node_cache[:examples][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_comment
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            r3 = _nt_space
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
          s0 << r2
          if r2
            r4 = _nt_examples_keyword
            s0 << r4
            if r4
              s5, i5 = [], index
              loop do
                r6 = _nt_space
                if r6
                  s5 << r6
                else
                  break
                end
              end
              r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
              s0 << r5
              if r5
                r8 = _nt_lines_to_keyword
                if r8
                  r7 = r8
                else
                  r7 = instantiate_node(SyntaxNode,input, index...index)
                end
                s0 << r7
                if r7
                  r9 = _nt_eol
                  s0 << r9
                  if r9
                    r10 = _nt_table
                    s0 << r10
                    if r10
                      r11 = _nt_white
                      s0 << r11
                    end
                  end
                end
              end
            end
          end
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(Examples0)
          r0.extend(Examples1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:examples][start_index] = r0

        r0
      end

      def _nt_multiline_arg
        start_index = index
        if node_cache[:multiline_arg].has_key?(index)
          cached = node_cache[:multiline_arg][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0 = index
        r1 = _nt_table
        if r1
          r0 = r1
        else
          r2 = _nt_py_string
          if r2
            r0 = r2
          else
            @index = i0
            r0 = nil
          end
        end

        node_cache[:multiline_arg][start_index] = r0

        r0
      end

      module LineToEol0
      end

      def _nt_line_to_eol
        start_index = index
        if node_cache[:line_to_eol].has_key?(index)
          cached = node_cache[:line_to_eol][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          i1, s1 = index, []
          i2 = index
          r3 = _nt_eol
          if r3
            r2 = nil
          else
            @index = i2
            r2 = instantiate_node(SyntaxNode,input, index...index)
          end
          s1 << r2
          if r2
            if index < input_length
              r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("any character")
              r4 = nil
            end
            s1 << r4
          end
          if s1.last
            r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
            r1.extend(LineToEol0)
          else
            @index = i1
            r1 = nil
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

        node_cache[:line_to_eol][start_index] = r0

        r0
      end

      module LinesToKeyword0
        def eol
          elements[0]
        end

        def reserved_words_and_symbols
          elements[2]
        end
      end

      module LinesToKeyword1
      end

      module LinesToKeyword2
        def build
          self.text_value.split("\n").map{|s| s.strip}.join("\n")
        end
      end

      def _nt_lines_to_keyword
        start_index = index
        if node_cache[:lines_to_keyword].has_key?(index)
          cached = node_cache[:lines_to_keyword][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          i1, s1 = index, []
          i2 = index
          i3, s3 = index, []
          r4 = _nt_eol
          s3 << r4
          if r4
            s5, i5 = [], index
            loop do
              r6 = _nt_space
              if r6
                s5 << r6
              else
                break
              end
            end
            r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
            s3 << r5
            if r5
              r7 = _nt_reserved_words_and_symbols
              s3 << r7
            end
          end
          if s3.last
            r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
            r3.extend(LinesToKeyword0)
          else
            @index = i3
            r3 = nil
          end
          if r3
            r2 = nil
          else
            @index = i2
            r2 = instantiate_node(SyntaxNode,input, index...index)
          end
          s1 << r2
          if r2
            if index < input_length
              r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("any character")
              r8 = nil
            end
            s1 << r8
          end
          if s1.last
            r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
            r1.extend(LinesToKeyword1)
          else
            @index = i1
            r1 = nil
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(LinesToKeyword2)

        node_cache[:lines_to_keyword][start_index] = r0

        r0
      end

      def _nt_reserved_words_and_symbols
        start_index = index
        if node_cache[:reserved_words_and_symbols].has_key?(index)
          cached = node_cache[:reserved_words_and_symbols][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0 = index
        r1 = _nt_step_keyword
        if r1
          r0 = r1
        else
          r2 = _nt_scenario_keyword
          if r2
            r0 = r2
          else
            r3 = _nt_scenario_outline_keyword
            if r3
              r0 = r3
            else
              r4 = _nt_table
              if r4
                r0 = r4
              else
                r5 = _nt_tag
                if r5
                  r0 = r5
                else
                  r6 = _nt_comment_line
                  if r6
                    r0 = r6
                  else
                    @index = i0
                    r0 = nil
                  end
                end
              end
            end
          end
        end

        node_cache[:reserved_words_and_symbols][start_index] = r0

        r0
      end

      def _nt_white
        start_index = index
        if node_cache[:white].has_key?(index)
          cached = node_cache[:white][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          i1 = index
          r2 = _nt_space
          if r2
            r1 = r2
          else
            r3 = _nt_eol
            if r3
              r1 = r3
            else
              @index = i1
              r1 = nil
            end
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

        node_cache[:white][start_index] = r0

        r0
      end

    end

    class FeatureParser < Treetop::Runtime::CompiledParser
      include Feature
    end

  end
end
