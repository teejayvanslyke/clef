$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
gem     'treetop'
require 'treetop'

gem     'andand'
require 'andand'

Treetop.load File.dirname(__FILE__) + '/clef'

require 'clef/note'
require 'clef/rest'
require 'clef/sequence'

module Clef

  def self.parse(expr)
    @parser ||= ClefParser.new
    @parser.parse(expr)
  end

  def self.evaluate(expr)
    self.parse(expr).andand.evaluate(nil)
  end

end
