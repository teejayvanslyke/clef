$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
gem     'treetop'
require 'treetop'

gem     'andand'
require 'andand'

require 'midiator'
require 'gamelan'
require 'drb'

Treetop.load File.dirname(__FILE__) + '/clef'

require 'core_ext/fixnum'

require 'clef/utils'
require 'clef/note'
require 'clef/rest'
require 'clef/harmony'
require 'clef/sequence'
require 'clef/environment'
require 'clef/channel'
require 'clef/console'

module Clef

  def self.parse(expr)
    @parser ||= ClefParser.new
    @parser.parse(expr)
  end

  def self.evaluate(expr)
    self.parse(expr).andand.evaluate(self.environment)
  end

  def self.last_failure
    @parser.failure_reason
  end

  def self.environment
    DRbObject.new(nil, 'druby://localhost:12345')
  end

end
