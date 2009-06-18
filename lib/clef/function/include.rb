module Clef

  module Function

    class Include

      def execute(*args)
        if args.empty?
          return help
        end

        begin
          Module.load(args.first)
          return "Loaded <#{args.first}>"
        rescue Clef::NoSuchModuleError
          return "No such module: <foo.bar>"
        end
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
