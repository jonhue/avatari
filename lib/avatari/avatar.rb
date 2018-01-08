module Avatari
    class Avatar

        attr_accessor :initials_method
        attr_accessor :colors
        attr_accessor :versions
        attr_accessor :default_version
        attr_accessor :process
        attr_accessor :extension_whitelist

        def initialize initials_method = nil, options = {}
            defaults = {
                colors: ['#000000'],
                versions: {
                    mini: [40,40],
                    tiny: [50,50],
                    small: [75,75],
                    medium: [100,100],
                    big: [350,350],
                    raw: [800,800]
                },
                default_version: nil,
                process: [800,800],
                extension_whitelist: ['jpg', 'jpeg', 'png']
            }
            defaults.merge! options

            @initials_method = initials_method
            @colors = options[:colors]
            @versions = options[:versions]
            @default_version = options[:default_version]
            @process = options[:process]
            @extension_whitelist = options[:extension_whitelist]
        end

        def initials object
            raw = object.send(self.initials_method)
            r = ''; raw.nil? ? nil : raw.split(' ').first(2).each { |n| r += n[0].upcase }
            return r
        end

    end
end
