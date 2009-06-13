module Clef

  module Function

    class Base

      def self.parse(keyword)
        eval("Clef::Function::#{keyword.capitalize}").new
      end

      def execute(*args)
        raise "implement me"
      end

      def call(function)
        function.execute(self)
      end

    end

  end

end
