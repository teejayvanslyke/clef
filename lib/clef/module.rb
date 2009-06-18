module Clef

  class NoSuchModuleError < Exception; end

  class Module < Treetop::Runtime::SyntaxNode

    def evaluate(env)
      text_value
    end

    def self.load(name)
      filename = File.join(name.split('.'))+'.clef'
      
      raise NoSuchModuleError unless File.exist?(filename)

      file     = File.open(filename)
      file.each_line do |line|
        Clef.evaluate(line)
      end
      
      return true
    end

  end

end
