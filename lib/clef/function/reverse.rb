module Clef

  module Function

    class Reverse < Base

      def execute(*args)
        return help unless args.first

        args.first.reverse
      end

      def help
        "Usage:  [C-4 D-4] -> reverse"
      end

    end

  end

end
