$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "difficult/customer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "difficult-customer"
  s.version     = Difficult::Customer::VERSION
  s.authors     = ["Alek Niemczyk"]
  s.email       = ["alek@rubylogic.pl"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Difficult::Customer."
  s.description = "TODO: Description of Difficult::Customer."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
