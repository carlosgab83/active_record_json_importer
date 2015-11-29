Gem::Specification.new do |s|
  s.name        = 'active_record_json_importer'
  s.version     = '0.0.1'
  s.date        = '2015-09-30'
  s.summary     = "Simple and fast way to bulk import massive active records into database. It uses the awesome activerecord-import gem"
  s.description = "Importing records from a json file go slow?. No problem, use me. It uses the awesome activerecord-import gem. Documentation and code in https://github.com/carlosgab83/active_record_json_importer/"
  s.authors     = ["Carlos Ochoa"]
  s.email       = 'carlosgab83@gmail.com'
  s.files       = `git ls-files -z`.split("\x0")
  s.homepage    = 'http://rubygems.org/gems/active_record_json_importer'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]


  s.add_development_dependency "bundler", "~> 1.6"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "rspec-its", "~> 1.0"
  s.add_development_dependency "activerecord-import", "~> 0.8"
  s.add_development_dependency "activesupport", "~> 4.2"
  s.add_development_dependency "sqlite3", "~> 1.3"
end