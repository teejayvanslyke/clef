module Clef

  class Channel

    def play(expression)
      @expression = expression
    end

    def to_s
      @expression.to_s
    end

  end

end


