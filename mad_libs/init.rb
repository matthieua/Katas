#### Mad Libs ####
#
# Launch this Ruby file from the command line 
# to get started.
#

APP_ROOT = File.dirname(__FILE__)

# require "#{APP_ROOT}/lib/guide"
# require File.join(APP_ROOT, 'lib', 'guide.rb')
# require File.join(APP_ROOT, 'lib', 'guide')

$:.unshift( File.join(APP_ROOT, 'lib') )
require 'mad_lib'

app = MadLib.new 'Lunch_Hungers.madlib'
# app = MadLib.new 'Gift_Giving.madlib'
app.launch!
