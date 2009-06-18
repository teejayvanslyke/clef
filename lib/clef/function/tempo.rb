module Clef

  module Function

    class Tempo < Base

      def execute(*args)
        Clef.environment.tempo = args.first.to_f
      end

    end

  end

end
