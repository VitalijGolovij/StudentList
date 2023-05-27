# frozen_string_literal: true

require_relative "lib/sstlistpplabs/version"

Gem::Specification.new do |spec|
  spec.name = "gemfile"
  spec.version = '1.0.1'
  spec.authors = ["vitalijgolovij"]
  spec.email = ["vitalijgl19@gmail.com"]

  spec.summary = "student list app with mvc and other patterns"
  spec.homepage = "https://github.com/VitalijGolovij"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files = Dir['../controller/*']
  spec.files += Dir['../database/*']
  spec.files += Dir['../List_models/*']
  spec.files += Dir['../Student_models/*']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
