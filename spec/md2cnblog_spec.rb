require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Md2Cnblog::BaseTranslator do
  before(:all) do
    @options = {no_intra_emphasis: true, autolink: true, space_after_headers: true}
  end

  it "should raise InvalidInputError" do
    lambda { Md2Cnblog::BaseTranslator.new(Object.new) }.should raise_error(Md2Cnblog::InvalidInputError)
    lambda { Md2Cnblog::BaseTranslator.new('string') }.should_not raise_error 
  end

  it 'should init markdown' do
    translator = Md2Cnblog::BaseTranslator.new('string')
    translator.markdown.should be_instance_of(Redcarpet::Markdown)
  end

  it 'should using default options' do
    options = {no_intra_emphasis: true, autolink: true, space_after_headers: true}
    translator = Md2Cnblog::BaseTranslator.new('string')
    translator.options.should eql(@options)
  end

  it 'should merge options to default options' do
    new_options = { space_after_headers: true, fenced_code_blocks: true }
    expected = @options.merge(new_options) 
    translator = Md2Cnblog::BaseTranslator.new('string', new_options)
    translator.options.should eql(expected)
  end

  it 'should raise InvalidOptionsError when option is not hash' do
    lambda { Md2Cnblog::BaseTranslator.new('string', Object.new) }.should raise_error(Md2Cnblog::InvalidOptionsError)
  end

  it 'should use default render' do
    translator = Md2Cnblog::BaseTranslator.new('string')
    translator.render.should be_instance_of(Redcarpet::Render::HTML)
  end

  it 'should render when calling start method' do
    translator = Md2Cnblog::BaseTranslator.new('string')
    translator.instance_variable_set(:@markdown, double(Redcarpet::Markdown))
    translator.instance_variable_get(:@markdown).should_receive(:render).with('string')
    translator.start()
  end

end
