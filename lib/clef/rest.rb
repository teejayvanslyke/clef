module Clef

  class Rest < Note
    def initialize
      super(nil, nil, nil)
    end

    def to_s
      '___'
    end

    def to_i
      -1
    end

    def +(rhs)
      self
    end

    def -(rhs)
      self
    end

  end

end

