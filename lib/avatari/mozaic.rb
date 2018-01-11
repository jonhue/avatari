require 'mozaic'

module Avatari
    module Mozaic

        ::Mozaic.configure do |config|
            config.define_component 'avatari/avatar' do
                options[:version] ||= options[:object].class.avatari_instance.default_version || ::Avatari.configuration.default_version
            end
        end

    end
end
