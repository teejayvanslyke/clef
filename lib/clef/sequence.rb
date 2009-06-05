module Clef

  class Sequence < Array

    def initialize(elements)
      super(elements)
    end

    def +(rhs)
      map {|note| note + rhs}
    end

  end

end
