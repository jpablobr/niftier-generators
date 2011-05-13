require 'generators/niftier'

module Niftier
  module Generators
    class SetupGenerator < Base
      argument :setup_name, :type => :string, :banner => 'setup_name'

      def create_setup
        copy_file "autotest.rb", "autotest/autotest.rb"
        copy_file "compass.rb", "config/compass.rb"
        copy_file "development.rb", "config/environments/development.rb"
        copy_file "discover.rb", "autotest/discover.rb"
        copy_file "Gemfile", "Gemfile"
        copy_file ".gitignore", ".gitignore"
        copy_file "production.rb", "config/environments/production.rb"
        copy_file "rcov.opts", "spec/rcov.opts"
        copy_file "spec_helper.rb", "spec/spec_helper.rb"
        copy_file "staging.rb", "config/environments/staging.rb"
        copy_file "test.rb", "config/environments/test.rb"
        template ".rvmrc", ".rvmrc"
        template "readme.md", "readme.md"
        template "database.yml", "config/database.yml"
      end

      private

      def file_name
        setup_name.underscore
      end

      def constant_name
        setup_name.underscore.upcase
      end
    end
  end
end
