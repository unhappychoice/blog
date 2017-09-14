# -*- encoding: utf-8 -*-
# stub: htmlcompressor 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "htmlcompressor".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Paolo Chiodi".freeze]
  s.date = "2015-04-01"
  s.description = "Put your html on a diet".freeze
  s.email = ["chiodi84@gmail.com".freeze]
  s.homepage = "".freeze
  s.rubygems_version = "2.6.11".freeze
  s.summary = "htmlcompressor provides a class and a rack middleware to minify html pages".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<yui-compressor>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<closure-compiler>.freeze, ["~> 1.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
    else
      s.add_dependency(%q<yui-compressor>.freeze, ["~> 0.9"])
      s.add_dependency(%q<closure-compiler>.freeze, ["~> 1.1"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    end
  else
    s.add_dependency(%q<yui-compressor>.freeze, ["~> 0.9"])
    s.add_dependency(%q<closure-compiler>.freeze, ["~> 1.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
  end
end
