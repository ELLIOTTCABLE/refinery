# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{Refinery}
  s.version = "0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["elliottcable"]
  s.date = %q{2008-11-17}
  s.description = %q{Mmmmagic}
  s.email = ["Refinery@elliottcable.com"]
  s.extensions = ["ext/defacto/extconf.rb", "ext/eigen/extconf.rb"]
  s.extra_rdoc_files = ["ext/defacto/defacto.c", "ext/defacto/extconf.rb", "ext/eigen/eigen.c", "ext/eigen/extconf.rb", "lib/refinery/core_ext/class.rb", "lib/refinery/core_ext/object.rb", "lib/refinery.rb", "LICENSE.text", "README.markdown"]
  s.files = ["ext/defacto/defacto.c", "ext/defacto/extconf.rb", "ext/eigen/eigen.c", "ext/eigen/extconf.rb", "lib/refinery/core_ext/class.rb", "lib/refinery/core_ext/object.rb", "lib/refinery.rb", "LICENSE.text", "Rakefile.rb", "README.markdown", "spec/refinery/core_ext/class_spec.rb", "spec/refinery/core_ext/object_spec.rb", "spec/refinery_spec.rb", "spec/spec_helper.rb", ".manifest", "refinery.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/elliottcable/refinery}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Refinery", "--main", "README.markdown"]
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{refinery}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Mmmmagic}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<elliottcable-echoe>, [">= 0", "= 3.0.2"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<stringray>, [">= 0"])
    else
      s.add_dependency(%q<elliottcable-echoe>, [">= 0", "= 3.0.2"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<stringray>, [">= 0"])
    end
  else
    s.add_dependency(%q<elliottcable-echoe>, [">= 0", "= 3.0.2"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<stringray>, [">= 0"])
  end
end
