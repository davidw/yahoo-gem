require 'hoe'

require './lib/yahoo'

DEV_DOC_PATH = 'Libraries/yahoo'

hoe = Hoe.new 'yahoo', Yahoo::VERSION do |p|
  p.summary = 'Base for Yahoo web services'
  p.description = 'This library makes it easy to implement Yahoo\'s web services APIs.'
  p.author = 'Eric Hodel'
  p.email = 'drbrain@segment7.net'
  p.url = "http://dev.robotcoop.com/#{DEV_DOC_PATH}"
  p.changes = File.read('History.txt').scan(/\A(=.*?)^=/m).first.first
  p.rubyforge_name = 'rctools'

  p.extra_deps << ['rc-rest', '>= 2.0.0']
end

SPEC = hoe.spec

begin
  require '../tasks'
rescue LoadError
end

# vim: syntax=Ruby

