class IteyeRender < ::Redcarpet::Render::HTML

  def block_code(code, lang)
    class_name = (lang.nil?)? '' : %Q[ class="#{lang}" ]
    %Q[<pre name="code" #{class_name}>#{code}</pre>]
  end

end #IteyeRender

module Md2Cnblog

  class IteyeTranslator < BaseTranslator

    def initialize(str)
      super(str, {}, ::IteyeRender)
    end

  end #IteyeTranslator

end #Md2Cnblog
