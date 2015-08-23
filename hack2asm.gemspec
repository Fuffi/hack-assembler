# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hack2asm/version'

Gem::Specification.new do |spec|
  spec.name          = "hack2asm"
  spec.version       = Hack2asm::VERSION
  spec.authors       = ["Federico"]
  spec.email         = ["ufinii@gmail.com"]
  spec.description   = %q{Assembler that takes .hack code and converts it to Hack machine ASM}
  spec.summary       = %q{Converts .hack files to .asm}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   << 'hack2asm'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
