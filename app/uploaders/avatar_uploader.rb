class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "/images/fallback/" + [version_name, "default.jpg"].compact.join('_')
  end

  process resize_to_limit: [768, 768]

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    [/image\//]
  end
end
