lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'bloomery/version'

Gem::Specification.new do |s|
  s.name          = 'bloomery'
  s.version       = Bloomery::VERSION
  s.date          = '2019-02-15'
  s.summary       = 'Generators for Gladius RoR development'
  s.description   = 'Bloomeries were used in the Roman empire to manufacture, among other things, Gladius swords'
  s.authors       = ['Martín Acuña']
  s.email         = 'martin@gladius.cl'
  s.files         = Dir['lib/**/*']
  s.require_paths = ['lib']
  s.homepage      = 'http://rubygems.org/gems/bloomery'
  s.license       = 'MIT'

  s.add_dependency('railties', '>= 4.1.0')
end
