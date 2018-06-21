
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "asana_cli_gem/version"

Gem::Specification.new do |spec|
  spec.name          = "asana_cli_gem"
  spec.version       = AsanaCliGem::VERSION
  spec.authors       = ["'Kayla Reopelle'"]
  spec.email         = ["'kreopelle@gmail.com'"]

  spec.summary       = %q{CLI to display information about strengthening yoga poses, or asanas, using Yoga Journal's pose library.}
  spec.description   = %q{Yoga Journal is a magazine that ‘provides authoritative information and insights about yoga’. Their website contains a yoga pose library with detailed information about many poses, also known as asanas. This gem scrapes their collection of strengthening yoga poses (https://www.yogajournal.com/poses/types/strength) and uses a CLI interface to allow a user to access detailed data about individual poses.   Upon entering the application, the user sees a list of strengthening yoga poses. The user is then prompted to either enter a number corresponding to the yoga pose they would like to learn more about, type ‘list’ to view the list again, or exit to end the program. When the user selects a pose, the individual pose page is scraped (ex: https://www.yogajournal.com/poses/full-boat-pose) and the English name, Sanskrit name, summary, beginner’s tip, and url are displayed. A user may click on the URL to open it in their default browser. Some poses do not have Sanskrit names or beginner’s tips. If so, those poses do not have the “Sanskrit Name” or “Beginner’s Tip” displayed in their detail view.
}
  spec.homepage      = "https://github.com/kreopelle/asana_cli_gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["asana-cli-gem"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "gem-release"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
