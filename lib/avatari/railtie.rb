require 'rails/railtie'

module Avatari
    class Railtie < Rails::Railtie

        initializer 'avatari.active_record' do
            ActiveSupport.on_load :active_record do
                include Avatari::Model
            end
        end

    end
end
