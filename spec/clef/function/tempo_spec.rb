require File.dirname(__FILE__) + '/../../spec_helper'

describe '- When changing the tempo' do

  before :each do
    Clef.stub!(:environment).and_return(Clef::Environment.new)
  end

  it 'should set the tempo within the environment' do
    Clef.evaluate('tempo(123)')
    Clef.environment.tempo.to_i.should == 122

    Clef.evaluate('tempo(200)')
    Clef.environment.tempo.to_i.should == 200
  end

end
