module Avatari
    module AvatarHelper

        def avatari? object
            object.avatar? || !object.class.avatari_instance.initials(object).nil?
        end

    end
end
