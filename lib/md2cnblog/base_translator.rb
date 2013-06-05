module Md2Cnblog
  class BaseTranslator
    attr_reader :markdown, :options, :output
    attr_accessor :render

    def initialize(str, options={}, render=nil)
      @str ||= str if valide_str?(str)
      @options = default_options.merge(options) if valide_option?(options)
      @render = render || default_render
      @markdown = ::Redcarpet::Markdown.new(@render, @options)
    end

    def valide_str?(str)
      raise InvalidInputError unless str.is_a?(String) 
      true
    end

    def valide_option?(options)
      raise InvalidOptionsError unless options.is_a?(Hash) 
      true
    end

    def default_options
      { no_intra_emphasis: true,
        autolink: true, 
        space_after_headers: true,
        fenced_code_blocks: true }
    end

    def default_render
      Redcarpet::Render::HTML.new()
    end

    def start
      start_mute
      echo 
    end

    def start_mute
      @output = @markdown.render(@str)
    end

    def echo
      print @output
    end

  end #BaseTranslator
end #Md2Cnblog
