
# Gem::Specification for Refinery-0
# Originally generated by Echoe

--- !ruby/object:Gem::Specification 
name: refinery
version: !ruby/object:Gem::Version 
  version: "0"
platform: ruby
authors: 
- elliottcable
autorequire: 
bindir: bin

date: 2008-10-01 00:00:00 -08:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: echoe
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: 3.0.1
    version: 
- !ruby/object:Gem::Dependency 
  name: rspec
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: rcov
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: yard
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: stringray
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
description: Mmmmagic
email: 
- Refinery@elliottcable.com
executables: []

extensions: 
- ext/sing/extconf.rb
extra_rdoc_files: 
- ext/sing/extconf.rb
- ext/sing/sing.c
- lib/refinery/core_ext/class.rb
- lib/refinery.rb
- README.markdown
files: 
- ext/sing/extconf.rb
- ext/sing/sing.c
- lib/refinery/core_ext/class.rb
- lib/refinery.rb
- Rakefile.rb
- README.markdown
- spec/refinery/core_ext/class_spec.rb
- spec/refinery_spec.rb
- spec/spec_helper.rb
- .manifest
- refinery.gemspec
has_rdoc: true
homepage: http://github.com/elliottcable/refinery
post_install_message: 
rdoc_options: 
- --line-numbers
- --inline-source
- --title
- Refinery
- --main
- README.markdown
require_paths: 
- lib
- ext
required_ruby_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
required_rubygems_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "1.2"
  version: 
requirements: []

rubyforge_project: refinery
rubygems_version: 1.3.0
specification_version: 2
summary: Mmmmagic
test_files: []
