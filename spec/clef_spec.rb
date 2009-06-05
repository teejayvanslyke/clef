require 'spec_helper'

describe Clef do

  describe '- When evaluating a sequence of notes' do
    
    def do_evaluate
      Clef.evaluate('(C-4 C#4 D-4 E-4)')
    end

    it 'should return a Sequence instance' do
      do_evaluate.should be_instance_of(Clef::Sequence)
    end

    it 'should have four elements' do
      do_evaluate.size.should == 4
    end

    it 'should have all elements in order' do
      %w(C-4 C#4 D-4 E-4).each_with_index do |note, index|
        do_evaluate[index].to_s.should == note
      end
    end

  end

  describe '- When evaluating a sequence of notes with rests' do
    
    def do_evaluate
      Clef.evaluate('(C-4 C#4 ___ D-4 E-4)')
    end

    it 'should have five elements' do
      do_evaluate.size.should == 5
    end

    it 'should have all elements in order' do
      %w(C-4 C#4 ___ D-4 E-4).each_with_index do |note, index|
        do_evaluate[index].to_s.should == note
      end
    end

    it 'should have a rest object in the appropriate position' do
      do_evaluate[2].should be_instance_of(Clef::Rest)
    end

  end

  describe '- When transposing (+) a sequence of notes' do

    describe 'from the left-hand side' do

      def do_evaluate
        Clef.evaluate('(C-4 C#4) + 12')
      end

      it 'should have the same number of elements as the original' do
        do_evaluate.size.should == 2
      end

      it 'should transpose the notes by the modifier' do
        do_evaluate[0].should == 'C-5'
        do_evaluate[1].should == 'C#5'
      end

    end

    describe 'from the right-hand side' do

      def do_evaluate
        Clef.evaluate('12 + (C-4 C#4)')
      end

      it 'should have the same number of elements as the original' do
        do_evaluate.size.should == 2
      end

      it 'should transpose the notes by the modifier' do
        do_evaluate[0].should == 'C-5'
        do_evaluate[1].should == 'C#5'
      end

    end

  end

  describe '- When transposing (-) a sequence of notes' do

    describe 'from the left-hand side' do

      def do_evaluate
        Clef.evaluate('(C-4 C#4) - 2')
      end

      it 'should have the same number of elements as the original' do
        do_evaluate.size.should == 2
      end

      it 'should transpose the notes by the modifier' do
        do_evaluate[0].should == 'A#3'
        do_evaluate[1].should == 'B-3'
      end
      
    end

    describe 'from the right-hand side' do

      def do_evaluate
        Clef.evaluate('-2 + (C-4 C#4)')
      end

      it 'should have the same number of elements as the original' do
        do_evaluate.size.should == 2
      end

      it 'should transpose the notes by the modifier' do
        do_evaluate[0].should == 'A#3'
        do_evaluate[1].should == 'B-3'
      end
      
    end

  end

  describe '- When repeating (*) a sequence of notes' do

    describe 'from the left-hand side' do

      def do_evaluate
        Clef.evaluate('(C-4 __) * 4')
      end

      it 'should be a repeated sequence of notes' do
        do_evaluate.to_s.should == '(C-4 ___ C-4 ___ C-4 ___ C-4 ___)'
      end

    end

    describe 'from the right-hand side' do

      def do_evaluate
        Clef.evaluate('2 * (C-4 __)')
      end

      it 'should be a repeated sequence of notes' do
        do_evaluate.to_s.should == '(C-4 ___ C-4 ___)'
      end

    end

  end

end
