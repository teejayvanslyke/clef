module Clef

  module Function

    class Include

      def execute(*args)
        if args.empty?
          return help
        end

        filename = File.join(*args.first.split('.'))+'.clef'

        file     = File.open(filename)
        file.each_line do |line|
          Clef.evaluate(line)
        end

        return "Loaded <#{args.first}>"
      end

      def help
        <<HELP
include
=======

- To have as a part, be made up out of; "The list includes the names of many famous writers"
- To consider as part of something; "I include you in the list of culprits"
- To admit: allow participation in or the right to be part of; permit to exercise the rights, functions, and responsibilities of; "admit someone to the profession"; "She was admitted to the New Jersey Bar" 

Syntax:  include myfile
         include mydir.myfile

HELP
      end

    end

  end
  
end
