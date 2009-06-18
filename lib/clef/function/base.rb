module Clef

  module Function

    class InvalidArgumentError          < Exception; end
    class InvalidNumberOfArgumentsError < Exception; end

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
