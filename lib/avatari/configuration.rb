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

        def initialize
            @default_version = :medium
        end

    end
    
end
