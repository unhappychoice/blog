# -*- encoding: utf-8 -*-
# stub: middleman-blog 4.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "middleman-blog".freeze
  s.version = "4.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas Reynolds".freeze, "Ben Hollis".freeze]
  s.date = "2015-12-16"
  s.description = "Blog engine for Middleman".freeze
  s.email = ["me@tdreyno.com".freeze, "ben@benhollis.net".freeze]
  s.homepage = "https://github.com/middleman/middleman-blog".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Blog engine for Middleman".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<middleman-core>.freeze, [">= 4.0.0"])
      s.add_runtime_dependency(%q<tzinfo>.freeze, [">= 0.3.0"])
      s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.4.0"])
    else
      s.add_dependency(%q<middleman-core>.freeze, [">= 4.0.0"])
      s.add_dependency(%q<tzinfo>.freeze, [">= 0.3.0"])
      s.add_dependency(%q<addressable>.freeze, ["~> 2.4.0"])
    end
  else
    s.add_dependency(%q<middleman-core>.freeze, [">= 4.0.0"])
    s.add_dependency(%q<tzinfo>.freeze, [">= 0.3.0"])
    s.add_dependency(%q<addressable>.freeze, ["~> 2.4.0"])
  end
end
