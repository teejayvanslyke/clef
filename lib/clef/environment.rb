module Clef

  class Environment

    def initialize
      @channels = []
      16.times { @channels << Channel.new }
    end

    def channel(number)
      @channels[number]
    end

  end

end
