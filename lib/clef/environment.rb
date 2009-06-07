module Clef

  class Environment

    attr_reader :channels

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

    private

    def initialize_channels
      @channels = []
      16.times {|i| @channels << Channel.new(i) }
    end

    def initialize_midi
      @events   = {}

      @time  = 0
      @beats = 16

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

      @time = @time + @beats

      @scheduler.at(@time) do
        schedule_events
      end
    end

  end

end

=begin
module Spieluhr

  module Engine

    class Sequencer

      attr_reader :events

      def initialize
        @events   = {}

        @time  = 0
        @beats = 16

        @midi = MIDIator::Interface.new
        @midi.use(:dls_synth)

        @midi.control_change(32, 10, 1)
        @midi.program_change(10, 26)

        @scheduler = Gamelan::Scheduler.new({:tempo => 180})
      end

      def beats
        @beats
      end

      def self.current
        DRbObject.new(nil, 'druby://localhost:12345')
      end

      def push(patch, line)
        @events[patch] ||= []
        @current_patch = patch
        patch.block.call(patch.parameters(line))
      end

      def schedule(time)
        @scheduler.at(@time + time) { yield self }
      end

      def tempo=(tempo)
        @scheduler.tempo = tempo
      end

      def play(options)
        event = Event.new(self, options)
        @events[@current_patch] << event
        event
      end

      def note_on(pitch, channel, velocity)
        @midi.note_on(pitch,channel,velocity)
      end

      def schedule_events
        @events.values.flatten.each do |event|
          event.schedule(self)
        end

        @time = @time + @beats

        @scheduler.at(@time) do
          schedule_events
        end
      end

      def run
        schedule_events
        @scheduler.run
      end

    end

  end

end
=end
