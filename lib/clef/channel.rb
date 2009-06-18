module Clef

  class Channel

    def initialize(number)
      @number     = number
      @expression = Sequence.new([])
    end

    def play(expression)
      @expression = expression
    end

    def to_s
      @expression.to_s
    end

    def to_i
      @number
    end

    def schedule(environment)
      @expression.each_with_index do |playable, time|
        if Harmony === playable
          playable.each do |note|
            environment.schedule_note_on(time, note.to_i, self.to_i, 127)
            environment.schedule_note_off(time+0.5, note.to_i, self.to_i, 127)
          end
        else
          environment.schedule_note_on(time, playable.to_i, self.to_i, 127)
          environment.schedule_note_off(time+0.5, playable.to_i, self.to_i, 127)
        end
      end
    end

  end

end


