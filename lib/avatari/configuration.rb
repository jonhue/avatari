module Avatari

    class << self
        attr_accessor :configuration
    end

    def self.configure
        self.configuration ||= Configuration.new
        yield configuration
    end

    class Configuration

        attr_accessor :default_version
        attr_accessor :mini_magick
        attr_accessor :storage

        def initialize
            @default_version = :medium
            @mini_magick = true
            @storage = :fog
        end

    end

end
