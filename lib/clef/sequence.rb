module Clef

  class Sequence < Array

    def initialize(elements)
      elements = [ elements ] unless elements.is_a?(Array)
      super(elements)
    end

    def +(rhs)
      map {|note| note + rhs}
    end

    def -(rhs)
      map {|note| note - rhs}
    end

    def /(rhs)
      result = []
      each do |note|
        result << note
        (rhs-1).times { result << Rest.new }
      end
      Sequence.new(result)
    end

    def to_s
      "(#{map {|n| n.to_s}.join(' ')})"
    end

  end

end
