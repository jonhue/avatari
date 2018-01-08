require 'rails/generators'
require 'rails/generators/migration'

class AvatariGenerator < Rails::Generators::Base

    include Rails::Generators::Migration

    source_root File.join File.dirname(__FILE__), 'templates'
    desc 'Install avatari'

    def create_initializer
        template 'initializer.rb', 'config/initializers/avatari.rb'
    end

end
