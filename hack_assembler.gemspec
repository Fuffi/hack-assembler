# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hack_assembler/version'

Gem::Specification.new do |spec|
  spec.name          = "hack_assembler"
  spec.version       = HackAssembler::VERSION
  spec.authors       = ["Federico Rebora"]
  spec.email         = ["ufinii@gmail.com"]
  spec.description   = %q{Assembler that takes .hack code and converts it to Hack machine ASM}
  spec.summary       = %q{Converts .hack files to .asm}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   << 'hack_assembler'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
