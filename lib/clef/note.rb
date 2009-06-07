module Clef

  class Note

    NOTES = %w(C- C# D- D# E- F- F# G- G# A- A# B-)

    attr_reader :octave

    def initialize(key, accent, octave)
      @key, @accent, @octave = key, accent, octave
    end

    def to_s
      "#{@key}#{@accent}#{@octave}"
    end

    def +(rhs)
      Clef::Note.from_i(to_i + rhs)
    end

    def -(rhs)
      Clef::Note.from_i(to_i - rhs)
    end

    def self.from_i(integer)
      key = NOTES[integer % 12]
      octave = (integer / 12).to_i
      new(key[0..0], key[1..1], octave)
    end

    def to_i
      NOTES.index("#{@key.upcase}#{@accent}") + (octave * 12)
    end

    def sharp?
      @accent == '#'
    end

    def <=>(rhs)
      self.to_i <=> rhs.to_i
    end

    def ==(rhs)
      if rhs === Note
        to_s == rhs.to_s
      elsif rhs.is_a?(String)
        to_s == rhs
      end
    end

  end

end
