# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "autotask/version"

Gem::Specification.new do |s|
  s.name        = "autotask"
  s.version     = Autotask::VERSION
  s.authors     = ["John Kamenik"]
  s.email       = ["jkamenik@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A SOAP wrapper for autotask}
  s.description = %q{Makes the usage of SOAP for the autotask API less sucky.}

  s.rubyforge_project = "autotask"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
