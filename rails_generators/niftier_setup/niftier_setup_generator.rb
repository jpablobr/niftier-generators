class NiftierSetupGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @name = @args.first || 'app'
  end

  def manifest
    record do |m|
      m.directory 'autotest'
      m.file "autotest.rb", "autotest/autotest.rb"
      m.file "compass.rb", "config/compass.rb"
      m.file "discover.rb", "autotest/discover.rb"
      m.file ".gitignore", ".gitignore"
      m.file "staging.rb", "config/environments/staging.rb"
      m.file "development.rb", "config/environments/development.rb"
      m.file "production.rb", "config/environments/production.rb"
      m.file "test.rb", "config/environments/test.rb"
      m.file "rcov.opts", "spec/rcov.opts"
      m.file "spec_helper.rb", "spec/spec_helper.rb"
      m.template "readme.md", "readme.md"
      m.template ".rvmrc", ".rvmrc"
      m.template "database.yml", "config/database.yml"
    end
  end

  def file_name
    @name.underscore
  end

  def constant_name
    @name.underscore.upcase
  end

  protected
  def banner
    <<-EOS
Creates setup and loader files.

USAGE: #{$0} #{spec.name} [setup_name]
EOS
  end
end
