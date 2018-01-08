module Avatari
    module AvatarHelper

        def avatari object, version = nil
            version ||= object.class.avatari_instance.default_version || ::Avatari.configuration.default_version
            version = version.to_s

            if object.avatar?
                image_tag object.avatar.url, class: 'avatari avatari--' + version
            elsif !object.class.avatari_instance.initials(object).nil?
                render partial: 'avatari/avatar', locals: { object: object, version: version }
            else
                false
            end
        end

    end
end
