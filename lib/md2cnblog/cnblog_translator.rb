class CnblogRender < ::Redcarpet::Render::HTML

  def block_code(code, lang)
    tail = 'gutter:false;'
    class_name = (lang.nil?)? '' : "brush:#{lang};"
    %Q[<pre class="#{class_name}#{tail}">#{code}</pre>]
  end

end #CnblogRender

module Md2Cnblog
  class CnblogTranslator < BaseTranslator

    def initialize(str)
      super(str, {}, ::CnblogRender)
    end

  end #IteyeTranslator

end #Md2Cnblog
