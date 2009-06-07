require 'set'

module Clef

  class Matrix < Array

    include Clef::Utils

    def initialize(sequences)
      return unless sequences.is_a?(Array) && sequences.size > 0
      rotate_matrix(sequences, :right)
      map! {|row| row.compact.uniq }
    end

    def to_s
      "[#{map {|row| "(#{row.sort.map {|n| n.to_s}.join(' ')})"}.join(' ')}]"
    end

  end

end
