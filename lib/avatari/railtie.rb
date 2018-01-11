require 'rails/railtie'

module Avatari
    class Railtie < Rails::Railtie

        initializer 'avatari.active_record' do
            ActiveSupport.on_load :active_record do
                include Avatari::Model
            end
        end

        initializer 'avatari.mozaic' do
            Mozaic.configure do |config|
                config.define_component 'avatari/avatar' do |options|
                    options[:version] ||= options[:object].class.avatari_instance.default_version || ::Avatari.configuration.default_version
                end
            end
        end

    end
end
