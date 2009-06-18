require File.dirname(__FILE__) + '/../../spec_helper'

describe '- When reversing a sequence' do
  it 'should parse the function call' do
    Clef.evaluate('reverse([C-4])').should_not be_nil
  end

  it 'should return a sequence instance' do
    Clef.evaluate('reverse([C-4 D-4 E-4 ___])').should be_instance_of(Clef::Sequence)
  end
  
  it 'should return a reversed version of the given sequence' do
    Clef.evaluate('reverse([C-4 D-4 E-4 ___])').to_s.should == '[___ E-4 D-4 C-4]'
  end

  it 'should allow chaining multiple reversals to get the same result' do
    Clef.evaluate('reverse(reverse([C-4 D-4]))').to_s.should == '[C-4 D-4]'
  end
end
