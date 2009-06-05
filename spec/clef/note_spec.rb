require File.dirname(__FILE__) + '/../spec_helper'

describe Clef::Note do

  describe '- When transposing' do
    (Clef::Note.from_i(60) + 12).to_i.should == 72
  end

end
