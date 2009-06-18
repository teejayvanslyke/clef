require File.dirname(__FILE__) + '/../../spec_helper'

describe '- When chordifying a sequence' do

  it 'should add additional harmonies for the second argument' do
    Clef.evaluate('chordify([C-3 D-3 E-3] 7)').to_s.should == '[(C-3 G-3) (D-3 A-3) (E-3 B-3)]'
  end

end
