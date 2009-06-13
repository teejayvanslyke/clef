# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{clef}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["teejayvanslyke"]
  s.date = %q{2009-06-12}
  s.email = %q{tj@elctech.com}
  s.executables = ["clef", "clef_server"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "bin/clef",
    "bin/clef_server",
    "lib/clef.rb",
    "lib/clef.treetop",
    "lib/clef/channel.rb",
    "lib/clef/console.rb",
    "lib/clef/environment.rb",
    "lib/clef/harmony.rb",
    "lib/clef/matrix.rb",
    "lib/clef/note.rb",
    "lib/clef/rest.rb",
    "lib/clef/sequence.rb",
    "lib/clef/utils.rb",
    "lib/core_ext/fixnum.rb",
    "spec/clef/note_spec.rb",
    "spec/clef_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/teejayvanslyke/clef}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/clef/note_spec.rb",
    "spec/clef_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gamelan>, [">= 0"])
      s.add_runtime_dependency(%q<midiator>, [">= 0"])
      s.add_runtime_dependency(%q<treetop>, [">= 0"])
      s.add_runtime_dependency(%q<andand>, [">= 0"])
    else
      s.add_dependency(%q<gamelan>, [">= 0"])
      s.add_dependency(%q<midiator>, [">= 0"])
      s.add_dependency(%q<treetop>, [">= 0"])
      s.add_dependency(%q<andand>, [">= 0"])
    end
  else
    s.add_dependency(%q<gamelan>, [">= 0"])
    s.add_dependency(%q<midiator>, [">= 0"])
    s.add_dependency(%q<treetop>, [">= 0"])
    s.add_dependency(%q<andand>, [">= 0"])
  end
end
