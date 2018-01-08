class Avatari::AvatarUploader < CarrierWave::Uploader::Base

    include CarrierWave::MiniMagick if ::Avatari.configuration&.mini_magick

    storage ::Avatari.configuration&.storage || :fog

    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
    def extension_whitelist
        model.class.avatari_instance.extension_whitelist
    end

    process :avatari_processing
    process :avatari_versioning

    def avatari_processing
        process(scale: model.class.avatari_instance.process) unless model.class.avatari_instance.process.nil?
    end
    def avatari_versioning
        return if model.class.avatari_instance.versions.nil?
        model.class.avatari_instance.versions.each do |name, size|
            version name.to_sym do
                process resize_to_fill: size.to_a
            end
        end
    end

end
