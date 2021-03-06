
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gmail_compose_encoder/version"

Gem::Specification.new do |spec|
  spec.name          = "gmail_compose_encoder"
  spec.version       = GmailComposeEncoder::VERSION
  spec.authors       = ["rob mathews"]
  spec.email         = ["rob.mathews@goodmeasures.com"]

  spec.summary       = %q{create the 'open a draft email in compose mode' url for the new gmail client}
  spec.description   = %q{
gmail_compose_encoder is a ruby implementation of googles - specifically gmails - url encoding scheme for opening the gmail in "compose message" mode on a particular draft email.

In particular, it is the ruby answer to this question:

What do I put into the URI querystring of the new Gmail UI to view a draft message created by the Gmail API?
  }
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
