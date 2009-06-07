require 'readline'

module Clef

  class Console

    def run

      puts "Clef."
      puts "An algorithmic music language."
      puts "By T.J. VanSlyke."
      puts "\n"

      loop do
        line = Readline::readline('$>> ')

        Readline::HISTORY.push(line)

        result = Clef.evaluate(line)

        if result.nil?
          puts "Clef didn't understand '#{line}'."
        else
          puts "=> #{result.to_s}"
        end

      end

    end

  end

end

