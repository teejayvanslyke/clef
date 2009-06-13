module Clef

  class Sequence < Array

    include Clef::Utils

    def initialize(elements)
      elements = [ elements ] unless elements.is_a?(Array)
      super(elements)
    end

    def +(rhs)
      Sequence.new(map {|note| note + rhs})
    end

    def &(rhs)
      sequences = [ self, rhs ] 
      sequences = rotate_matrix(sequences, :right)
      Sequence.new(sequences.map {|row| Harmony.new(row)})
    end

    def -(rhs)
      Sequence.new(map {|note| note - rhs})
    end

    def /(rhs)
      result = []
      each do |note|
        result << note
        (rhs-1).times { result << Rest.new }
      end
      Sequence.new(result)
    end

    def call(function)
      function.execute(self)
    end

    def to_s
      "[#{map {|n| n.to_s}.join(' ')}]"
    end

  end

end
