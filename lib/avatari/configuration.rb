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

        def initialize
            @default_version = :medium
            @mini_magick = true
        end

    end

end
