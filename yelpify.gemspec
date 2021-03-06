# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yelpify/version'

Gem::Specification.new do |spec|
  spec.name          = "yelpify"
  spec.version       = Yelpify::VERSION
  spec.authors       = ["Lili Serfaty"]
  spec.email         = ["lili.serfaty@gmail.com"]
  spec.summary       = %q{Facilitate the use of the yelp API.}
  spec.description   = %q{Facilitate the use of the yelp API.}
  spec.homepage      = "https://github.com/liliserf/yelpify"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "oauth", "~> 0.4.7"
  spec.add_runtime_dependency "dotenv", "~> 1.0.2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "pry-byebug", "~> 0.10.1"
  spec.add_development_dependency "vcr", "~> 2.9.3"
  spec.add_development_dependency "webmock", "~> 1.20.2"
end
