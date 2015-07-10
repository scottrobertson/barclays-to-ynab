# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'barclays-to-ynab/version'

Gem::Specification.new do |gem|
  gem.authors       = ['Scott Robertson']
  gem.email         = ['scottymeuk@gmail.com']
  gem.description   = %q{Convert Barclays CSV exports into YNAB compatible imports}
  gem.summary       = %q{Barclays YNAB converter}
  gem.homepage      = "https://github.com/scottrobertson/barclays-to-ynab"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = ["barclays-to-ynab"]
  gem.name          = "barclays-to-ynab"
  gem.require_paths = ["lib"]
  gem.version       = BarclaysToYnab::VERSION
  gem.licenses      = ['MIT']
end
