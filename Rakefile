require 'hoe'

require './lib/yahoo'

DEV_DOC_PATH = 'Libraries/yahoo'

hoe = Hoe.new 'yahoo', Yahoo::VERSION do |p|
  p.summary = 'Base for Yahoo web services'
  p.description = 'This library makes it easy to implement Yahoo\'s web services APIs.'
  p.author = 'David N. Welton'
  p.email = 'davidw@dedasys.com'
  p.url = "http://github.com/davidw/yahoo-gem"
  p.changes = File.read('History.txt').scan(/\A(=.*?)^=/m).first.first
  p.rubyforge_name = 'rctools'

  p.extra_deps << ['rc-rest', '>= 3.0.0']
end

SPEC = hoe.spec

begin
  require '../tasks'
rescue LoadError
end

# vim: syntax=Ruby

