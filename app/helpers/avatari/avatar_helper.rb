module Avatari
    module AvatarHelper

        def avatari object, size = :medium
            if object.avatar?
                image_tag object.avatar.url, class: 'avatari ' + (size ? 'avatari--' + size.to_s : '')
            elsif !object.class.avatari_initials.nil?
                render partial: 'avatari/avatar', object: object, size: size.to_s
            else
                false
            end
        end

    end
end
