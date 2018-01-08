module Avatari
    module Model

        extend ActiveSupport::Concern

        def avatari_color
            if defined?(self.avatar_color)
                self.update_attributes(avatar_color: self.class.avatari_instance.colors.sample) if self.avatar_color.nil?
                self.avatar_color
            else
                self.class.avatari_instance.colors.sample
            end
        end

        module ClassMethods

            attr_accessor :avatari_instance

            def avatari initials_method = nil, options = {}
                self.avatari_instance = ::Avatari::Avatar.new initials_method, options
                mount_uploader :avatar, ::Avatari::AvatarUploader
            end

        end

    end
end
