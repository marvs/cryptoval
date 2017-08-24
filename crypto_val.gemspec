# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crypto_val/version'

Gem::Specification.new do |spec|
  spec.name          = "crypto_val"
  spec.version       = CryptoVal::VERSION
  spec.authors       = ["Marvin Baltazar"]
  spec.email         = ["marvin.baltazar@gmail.com"]

  spec.summary       = %q{Ruby wrapper for the latest valuations of various cryptocurrencies.}
  spec.description   = %q{Ruby wrapper for the latest valuations of various cryptocurrencies.}
  spec.homepage      = "https://github.com/marvs/cryptoval"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
