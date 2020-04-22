require_relative 'lib/covid/version'

Gem::Specification.new do |spec|
  spec.name          = "covid"
  spec.version       = Covid::VERSION
  spec.authors       = ["erinstansbury"]
  spec.email         = ["ekstansbury@gmail.com"]

  spec.summary       = %q{This gem will allow you to see the recently reported cases of the Covid19 virus.}
  spec.description   = %q{This gem displays the number of covid19 cases worldwide, the number of cases that are currently considered active, and from there which are mild or serious. There is an option to display the top 10 countries most affected as well as the death and recovered counts.}
  spec.homepage      = "https://github.com/erinstansbury/covidCLI"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = 'http://mygemserver.com'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/erinstansbury/covidCLI"
 

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 1.0.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
