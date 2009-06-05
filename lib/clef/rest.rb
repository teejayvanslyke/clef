module Clef

  class Rest < Note
    def initialize
      super(nil, nil, nil)
    end

    def to_s
      '___'
    end

  end

end

