module Clef

  module Function

    class Chordify < Base

      def execute(*args)
        raise InvalidNumberOfArgumentsError.new(args.size) unless args.size > 1

        unless args.first.is_a?(Clef::Sequence)
          raise InvalidArgumentError.new(args.first, :expected => :sequence) 
        end

        clone   = args.first.clone
        levels  = [0] + args[1..args.length-1]
        
        clone.each_with_index do |element, index|
          levels.map {|level| element + level} 
          clone[index] = Clef::Harmony.new(levels.map {|level| element + level}) 
        end

        return clone
      end

    end

  end

end
