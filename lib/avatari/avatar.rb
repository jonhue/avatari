module Avatari
    class Avatar

        attr_accessor :initials_method
        attr_accessor :colors
        attr_accessor :default_version

        def initialize initials_method = nil, options = {}
            defaults = {
                colors: ['#000000'],
                default_version: nil
            }
            defaults.merge! options
            @initials_method = initials_method
            @colors = options[:colors]
            @default_version = options[:default_version]
        end

    end
end
