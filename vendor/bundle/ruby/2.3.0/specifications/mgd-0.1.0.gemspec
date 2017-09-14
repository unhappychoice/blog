# -*- encoding: utf-8 -*-
# stub: mgd 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mgd".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yegor Bugayenko".freeze, "Jan Hovancik".freeze]
  s.date = "2015-12-27"
  s.description = "Automated deployment of your Middleman blog to Github Pages".freeze
  s.email = "conta.srdr@gmail.com".freeze
  s.executables = ["mgd".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "LICENSE.txt".freeze]
  s.files = ["LICENSE.txt".freeze, "README.md".freeze, "bin/mgd".freeze]
  s.homepage = "http://github.com/hovancik/middleman-github-deploy".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Middleman Github Deploy".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<trollop>.freeze, ["= 2.1.2"])
      s.add_runtime_dependency(%q<middleman>.freeze, [">= 3.0.0"])
      s.add_development_dependency(%q<coveralls>.freeze, ["= 0.7.0"])
      s.add_development_dependency(%q<rdoc>.freeze, ["= 3.11"])
      s.add_development_dependency(%q<minitest>.freeze, ["= 5.4.0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["= 0.24.1"])
      s.add_development_dependency(%q<rubocop-rspec>.freeze, ["= 1.1.0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["= 2.13"])
    else
      s.add_dependency(%q<trollop>.freeze, ["= 2.1.2"])
      s.add_dependency(%q<middleman>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<coveralls>.freeze, ["= 0.7.0"])
      s.add_dependency(%q<rdoc>.freeze, ["= 3.11"])
      s.add_dependency(%q<minitest>.freeze, ["= 5.4.0"])
      s.add_dependency(%q<rubocop>.freeze, ["= 0.24.1"])
      s.add_dependency(%q<rubocop-rspec>.freeze, ["= 1.1.0"])
      s.add_dependency(%q<rspec-rails>.freeze, ["= 2.13"])
    end
  else
    s.add_dependency(%q<trollop>.freeze, ["= 2.1.2"])
    s.add_dependency(%q<middleman>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<coveralls>.freeze, ["= 0.7.0"])
    s.add_dependency(%q<rdoc>.freeze, ["= 3.11"])
    s.add_dependency(%q<minitest>.freeze, ["= 5.4.0"])
    s.add_dependency(%q<rubocop>.freeze, ["= 0.24.1"])
    s.add_dependency(%q<rubocop-rspec>.freeze, ["= 1.1.0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["= 2.13"])
  end
end
