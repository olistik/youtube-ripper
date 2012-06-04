# -*- encoding: utf-8 -*-
require File.expand_path('../lib/youtube-ripper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Maurizio De Magnis"]
  gem.email         = ["maurizio.demagnis@gmail.com"]
  gem.description   = %q{Download YouTube videos given their public URL.}
  gem.summary       = %q{Download YouTube videos given their public URL.}
  gem.homepage      = ""

  gem.add_dependency('nokogiri', '~> 1.5.2')

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "youtube-ripper"
  gem.require_paths = ["lib"]
  gem.version       = Youtube::Ripper::VERSION
end
