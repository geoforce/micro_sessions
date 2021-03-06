# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "micro_sessions/version"

Gem::Specification.new do |s|
  s.name        = "micro_sessions"
  s.version     = MicroSessions::VERSION
  s.author      = "Ben Hughes"
  s.email       = "ben@railsgarden.com"
  s.homepage    = "http://github.com/rubiety/micro_sessions"
  s.summary     = "Keyed sessions within the global sessions object."
  s.description = "Provides 'micro-sessions' within the global sessions object keyed off an identifier."

  s.files         = Dir["{lib,vendor,spec}/**/*", "[A-Z]*"]
  s.require_paths = ["lib"]

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"

  s.add_dependency("rails", [">= 4.1.1"])
  s.add_development_dependency("rspec", ["~> 2.0"])
  s.add_development_dependency("sqlite3", ["~> 1.3.4"])
  s.add_development_dependency("rdoc", ["~> 3.12"])
  s.add_development_dependency("rake")
  s.add_development_dependency("launchy")
end
