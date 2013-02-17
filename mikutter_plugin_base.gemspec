# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mikutter_plugin_base/version'

Gem::Specification.new do |gem|
  gem.name          = "mikutter_plugin_base"
  gem.version       = MikutterPluginBase::VERSION
  gem.authors       = ["Taiki ONO"]
  gem.email         = ["taiks.4559@gmail.com"]
  gem.description   = %q{Write mikutter plugin using module system like Sinatra.}
  gem.summary       = %q{Add new way to write mikutter plugin.}
  gem.homepage      = "http://taiki45.github.com/mikutter-plugin-base/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
