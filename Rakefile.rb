require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'
require 'find'

# Don't include resource forks in tarballs on Mac OS X.
ENV['COPY_EXTENDED_ATTRIBUTES_DISABLE'] = 'true'
ENV['COPYFILE_DISABLE'] = 'true'

# Gemspec
gemspec = Gem::Specification.new do |s|
  s.rubyforge_project = 'riemann-sockstat'

  s.name = 'riemann-sockstat'
  s.version = '0.0.1'
  s.author = 'Fernando Alonso'
  s.email = 'krakatoa1987@gmail.com'
  s.homepage = 'https://github.com/krakatoa/riemann-sockstat'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Riemann agent to collect sockstat metrics.'

  s.add_dependency 'riemann-tools', '>= 0.2.6'

  s.files = FileList['lib/**/*', 'bin/*', 'LICENSE', 'README.md'].to_a
  s.executables |= Dir.entries('bin/')
  s.require_path = 'lib'
  s.has_rdoc = false

  s.required_ruby_version = '>= 2.0.0'
end

Gem::PackageTask.new gemspec do |p|
end

RDoc::Task.new do |rd|
  rd.main = 'Riemann sockstat'
  rd.title = 'Riemann sockstat'
  rd.rdoc_dir = 'doc'
end
