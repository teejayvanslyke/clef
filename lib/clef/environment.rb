module Clef

  class Environment

    attr_reader :channels
    attr_reader :period

    def initialize
      initialize_channels
      initialize_midi
    end

    def run
      schedule_events
      @scheduler.run
    end

    def tempo=(tempo)
      @scheduler.tempo = tempo
    end

    def play(channel, expression)
      channels[channel].play(expression)
    end

    def schedule_note_on(time, pitch, channel, velocity)
      @scheduler.at(@time + time) { @midi.note_on(pitch,channel,velocity) }
    end

    def schedule_note_off(time, pitch, channel, velocity)
      @scheduler.at(@time + time) { @midi.note_off(pitch,channel,velocity) }
    end

    private

    def initialize_channels
      @channels = []
      16.times {|i| @channels << Channel.new(i) }
    end

    def initialize_midi
      @events   = {}

      @time   = 0
      @period = 16

      @midi = MIDIator::Interface.new
      @midi.use(:dls_synth)

      @midi.control_change(32, 10, 1)
      @midi.program_change(10, 26)

      @scheduler = Gamelan::Scheduler.new({:tempo => 180})
    end

    def schedule_events
      @channels.each do |channel|
        channel.schedule(self)
      end

      @time = @time + @period

      @scheduler.at(@time) do
        schedule_events
      end
    end

  end

end

