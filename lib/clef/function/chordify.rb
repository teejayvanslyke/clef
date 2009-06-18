module Clef

  module Function

    class Chordify < Base

      def execute(*args)
        clone = args.first.clone
        
        clone.each_with_index do |element, index|
          clone[index] = Clef::Harmony.new([ element, element + args[1] ])
        end

        return clone
      end

    end

  end

end
