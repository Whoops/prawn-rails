require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rubygems'

PKG_FILES = FileList[
  '[a-zA-Z]*',  
  'lib/**/*',
  'rails/**/*',  
  'test/**/*'
]

spec = Gem::Specification.new do |s|
  s.name = "prawn_rails"
  s.version = "0.0.4"
  s.author = "Walton Hoops"
  s.email = "me@waltonhoops.com"
  s.homepage = "http://github.com/Volundr/prawn-rails"
  s.add_dependency('rails', '>=3.0.0')
  s.add_dependency('prawn', '>=0.8.4')
  s.platform = Gem::Platform::RUBY
  s.summary = "Integrates Prawn into Rails in a natural way"
  s.description=<<-EOF
  The prawn_rails gem provides a Prawn based view engine for creating PDFs with rails.
  EOF
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.has_rdoc = false
  s.extra_rdoc_files = ["README.rdoc"]
end

desc 'Default: create gem'
task :default => :gem

desc 'Turn this plugin into a gem.'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc 'Test the prawn_rails plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the prawn_rails plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'PrawnRails'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
