require 'readline'

module Clef

  class Console

    def run

      puts "Clef."
      puts "An algorithmic music language."
      puts "By T.J. VanSlyke."
      puts "\n"

      loop do
        begin
          line = Readline::readline('$>> ')

          if line.nil?
            puts "\nExiting..."
            return
          end

          Readline::HISTORY.push(line)

          result = Clef.evaluate(line)

          if result.nil?
            puts "Clef didn't understand '#{line}': #{Clef.last_failure}"
          else
            puts "=> #{result.to_s}"
          end
        rescue Exception => e
          puts "#{e}"
        end
      end

    end

  end

end

