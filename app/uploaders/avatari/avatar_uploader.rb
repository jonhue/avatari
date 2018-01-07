class Avatari::AvatarUploader < CarrierWave::Uploader::Base

    # Include MiniMagick support:
    include CarrierWave::MiniMagick

    # Choose AWS as file storage:
    storage :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # Process files as they are uploaded:
    process scale: [800, 800]

    # Create different versions of your uploaded files:
    version :raw do
        process resize_to_fill: [800, 800]
    end

    version :big, from_version: :raw do
        process resize_to_fill: [350, 350]
    end

    version :medium, from_version: :big do
        process resize_to_fill: [100, 100]
    end

    version :small, from_version: :medium do
        process resize_to_fill: [75, 75]
    end

    version :tiny, from_version: :small do
        process resize_to_fill: [50, 50]
    end

    version :mini, from_version: :tiny do
        process resize_to_fill: [40, 40]
    end

    # White list of extensions which are allowed to be uploaded:
    def extension_whitelist
        %w(jpg jpeg png)
    end

end
