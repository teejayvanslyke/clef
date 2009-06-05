module Clef

  class Sequence < Array

    def initialize(elements)
      super(elements)
    end

    def +(rhs)
      map {|note| note + rhs}
    end

    def -(rhs)
      map {|note| note - rhs}
    end

    def to_s
      "(#{map {|n| n.to_s}.join(' ')})"
    end

  end

end
