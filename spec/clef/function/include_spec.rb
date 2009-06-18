require File.dirname(__FILE__) + '/../../spec_helper'

describe '- When including source files' do

  before :each do
    Clef.stub!(:environment).and_return(Clef::Environment.new)
  end

  it 'should parse the include command' do
    Clef.evaluate('include(examples.mary)').should == 'Loaded <examples.mary>'
  end

  it 'should include the given source file within the environment' do
    Clef.evaluate('include(examples.mary)')
    Clef.evaluate('@1').to_s.should == '[E-4 D-4 C-4 D-4 E-4 E-4 E-4 E-4 D-4 C-4 D-4 E-4 E-4 E-4 E-4 D-4]'
  end

  it 'should complain if the module cannot be found' do
    lambda { Clef.evaluate('include(foo.bar)') }.should raise_error(Clef::NoSuchModuleError)
  end

end
