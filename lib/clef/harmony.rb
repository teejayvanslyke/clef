require 'set'

module Clef

  class Harmony < Set

    def initialize(elements)
      notes = []
      elements.each do |e|
        if Harmony === e
          notes += e.to_a
        else
          notes << e
        end
      end

      super(notes.compact.uniq)
    end

    def to_s
      if size == 1
        map {|n| n.to_s}.join(' ')
      else
        "(#{sort.map {|n| n.to_s}.join(' ')})"
      end
    end

    def +(rhs)
      if rhs.is_a?(Fixnum)
        Harmony.new(map {|n| n + rhs})
      else 
        super(rhs)
      end
    end

  end

end
