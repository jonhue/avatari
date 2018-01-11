require 'avatari/version'

module Avatari

    require 'avatari/configuration'

    autoload :Avatar, 'avatari/avatar'

    autoload :Mozaic, 'avatari/mozaic'

    require 'avatari/engine'
    require 'avatari/railtie'

end
