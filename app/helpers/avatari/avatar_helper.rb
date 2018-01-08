module Avatari
    module AvatarHelper

        def avatari object, version = :medium
            if object.avatar?
                image_tag object.avatar.url, class: 'avatari avatari--' + version.to_s
            elsif !object.class.avatari_initials.nil?
                render partial: 'avatari/avatar', locals: { object: object, version: version.to_s }
            else
                false
            end
        end

    end
end
