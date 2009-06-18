require 'spec_helper'

describe Clef do

  before :each do
    Clef.stub!(:environment).and_return(Clef::Environment.new)
  end

  describe '- When parsing' do
    it 'should allow whitespace padding' do
      Clef.evaluate('  [C-4   ]').should be_instance_of(Clef::Sequence)
    end
  end

  describe '- When evaluating a sequence of notes' do
    
    def do_evaluate
      Clef.evaluate('[C-4 C#4 D-4 E-4]')
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

    it 'should allow empty sequences' do
      Clef.evaluate('[]').should be_instance_of(Clef::Sequence)
      Clef.evaluate('[ ]').should be_instance_of(Clef::Sequence)
    end

  end

  describe '- When evaluating a sequence of notes with rests' do
    
    def do_evaluate
      Clef.evaluate('[C-4 C#4 ___ D-4 E-4]')
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
        Clef.evaluate('[C-4 C#4] + 12')
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
        Clef.evaluate('12 + [C-4 C#4]')
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
        Clef.evaluate('[C-4 C#4] - 2')
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
        Clef.evaluate('-2 + [C-4 C#4]')
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

  describe '- When transposing a sequence of notes with rests' do
    it 'should leave the rests alone' do
      Clef.evaluate('[C-3 ___] + 12').to_s.should == '[C-4 ___]'
    end
  end

  describe '- When repeating (*) a sequence of notes' do

    describe 'from the left-hand side' do

      def do_evaluate
        Clef.evaluate('[C-4 __] * 4')
      end

      it 'should be a repeated sequence of notes' do
        do_evaluate.to_s.should == '[C-4 ___ C-4 ___ C-4 ___ C-4 ___]'
      end

    end

    describe 'from the right-hand side' do

      def do_evaluate
        Clef.evaluate('2 * [C-4 __]')
      end

      it 'should be a repeated sequence of notes' do
        do_evaluate.to_s.should == '[C-4 ___ C-4 ___]'
      end

    end

  end

  describe '- When rest-padding (/) a sequence of notes' do

    describe 'from the left-hand side' do

      it 'should insert the appropriate number of rests' do
        Clef.evaluate('[C-4] / 4').to_s.should == '[C-4 ___ ___ ___]'
        Clef.evaluate('[C-4 ___] / 4').to_s.should == '[C-4 ___ ___ ___ ___ ___ ___ ___]'
        Clef.evaluate('[C-4 ___ C#4 ___ C-4 ___] / 4').to_s.should ==
          '[C-4 ___ ___ ___ ___ ___ ___ ___ C#4 ___ ___ ___ ___ ___ ___ ___ C-4 ___ ___ ___ ___ ___ ___ ___]'
      end

    end

  end

  describe '- When combining two sequences into a matrix' do

    def do_evaluate
      Clef.evaluate('[C-4] & [C#4]')
    end

    it 'should have a length of 1' do
      do_evaluate.length.should == 1
    end

    it 'should render a string representation' do
      do_evaluate.to_s.should == '[(C-4 C#4)]'
    end

  end

  describe '- When combining two complex sequences into a matrix' do

    def do_evaluate
      Clef.evaluate('[C-4 D-4 E-4] & [C-5 D-5 ___]')
    end

    it 'should combine appropriately' do
      do_evaluate.to_s.should == '[(C-4 C-5) (D-4 D-5) (___ E-4)]'
    end

  end

  describe '- When parsing complex expressions' do

    it 'should parse transposed sequences' do
      Clef.evaluate('([C-3 D-3] + 12) & [C-4]').to_s.should == '[C-4 D-4]'
    end

    it 'should parse chained unions' do
      Clef.evaluate('[C-3] & [E-3] & [G-3]').to_s.should == '[(C-3 E-3 G-3)]'
    end

    it 'should allow transposing unions' do
      Clef.evaluate('[C-3] & [E-3] & [G-3] + 12').to_s.should == '[(C-4 E-4 G-4)]'
    end

  end

  describe '- When assigning sequences to channels' do

    it 'should behave just like a sequence' do
      Clef.evaluate('@1 = [C-3 D-3 E-3]')
      Clef.evaluate('@1').to_s.should == '[C-3 D-3 E-3]'
    end

  end

  describe '- When including source files' do
    it 'should parse the include command' do
      Clef.evaluate('include(examples.mary)').should == 'Loaded <examples.mary>'
    end

    it 'should include the given source file within the environment' do
      Clef.evaluate('include(examples.mary)')
      Clef.evaluate('@1').to_s.should == '[E-4 D-4 C-4 D-4 E-4 E-4 E-4]'
    end
  end

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

end
