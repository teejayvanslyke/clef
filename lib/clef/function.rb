$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'function/base'
require 'function/include'
require 'function/reverse'
require 'function/chordify'
require 'function/tempo'
