module Clef

  class NoSuchModuleError < Exception
    def initialize(object)
      @object = object
    end

    def object; @object; end

    def to_s
      "No such module: #{@object}"
    end
  end

  class Module < Treetop::Runtime::SyntaxNode

    def evaluate(env)
      @name = text_value
      raise NoSuchModuleError.new(self) unless File.exist?(filename)

      return self
    end

    def filename
      File.join(@name.split('.'))+'.clef'
    end

    def load
      file     = File.open(filename)
      file.each_line do |line|
        Clef.evaluate(line)
      end
      
      return true
    end

    def to_s
      "<#{@name}>"
    end

  end

end
