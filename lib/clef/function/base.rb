module Clef

  module Function

    class Base

      def self.parse(keyword)
        eval("Clef::Function::#{keyword.capitalize}").new
      end

      def execute(*args)
        raise "implement me"
      end

    end

  end

end
