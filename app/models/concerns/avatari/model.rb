module Avatari
    module Model

        extend ActiveSupport::Concern

        def avatari_color
            if self.avatar_color
                self.update_attributes(avatar_color: self.class.avatari_colors.sample) if self.avatar_color.nil?
                self.avatar_color
            end
        end

        module ClassMethods

            attr_accessor :avatari_colors
            attr_accessor :avatari_initials

            def avatari initials = nil, options = {}
                defaults = {
                    colors: nil
                }
                defaults.merge! options

                self.avatari_colors = options[:colors] || ['#000000']
                self.avatari_initials = initials

                serialize :avatar_color, Array
                mount_uploader :avatar, ::Avatari::AvatarUploader
            end

        end

    end
end
