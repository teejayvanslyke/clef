module Clef

  module Utils
    # Adapted from http://snippets.dzone.com/posts/show/3404
    def rotate_matrix(matrix, direction)
      # - You must Rotate the matrix neo!
      oldMap = matrix

      map = []

      # Get the number of lines in the old map (they're the new columns)
      lineCount = oldMap.size
      # Get the number of columns in the old map (We have that many rows now)
      columnCount = oldMap[0].size
      columnCount.times { map.push [] }

      # Loop through every line in the old map, retrieve the appropriate column
      # and make a horizontal column with it's contents
      # we'll take one (old)line at a time and rotate it.
      onLine = 0
      oldMap.each do |oldLine|
        onColumn = 0
        oldLine.each do
          case direction
          when :right
            map[(columnCount - 1) - onColumn][(lineCount - 1) - onLine] = oldLine[(columnCount - 1) - onColumn]
          when :left
            map[onColumn][onLine] = oldLine[(columnCount - 1) - onColumn]
          end
          onColumn += 1
        end
        onLine += 1
      end
      map
    end
  end

end

