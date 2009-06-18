module Clef

  class Sequence 

    include Enumerable
    include Clef::Utils

    def initialize(elements)
      if elements.is_a?(Array)
        @elements = elements
      else
        @elements = [ elements ]
      end
    end

    def size
      @elements.size
    end

    def length 
      @elements.length
    end

    def [](index)
      @elements[index]
    end

    def []=(index, rhs)
      @elements[index] = rhs
    end

    def *(rhs)
      Sequence.new(@elements * rhs)
    end

    def reverse
      Sequence.new(@elements.reverse)
    end

    def each
      @elements.each {|e| yield e}
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
