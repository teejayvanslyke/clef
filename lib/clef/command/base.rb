module Clef

  module Command

    class Base

      def self.parse(keyword)
        eval("Clef::Command::#{keyword.capitalize}Command").new
      end

      def execute(*args)
        raise "implement me"
      end

    end

  end

end
