require File.dirname(__FILE__) + '/../spec_helper'

describe Clef::Sequence do

  describe '- When fitting a sequence to a given tick period' do

    it 'should repeat if not long enough' do
      Clef.evaluate('[C-4 D-4]').fit(4).to_s.should == '[C-4 D-4 C-4 D-4]'
    end

    it 'should truncate if too long' do
      Clef.evaluate('[C-2 E-2]').fit(1).to_s.should == '[C-2]'
    end

  end

end

