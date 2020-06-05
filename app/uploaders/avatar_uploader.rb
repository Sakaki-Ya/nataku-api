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

  # 下記設定を有効にすると、attach_avatarアクションでエラーが発生します。
  # version :config_thumb do
  #   process resize_to_fit: [100, 100, "#f8f8f8", "Center"]
  # end
  # version :post_thumb do
  #   process resize_to_fit: [50, 50, "#f8f8f8", "Center"]
  # end
  # 
  # 下記リンクは私が投稿したIssueです。
  # https://github.com/minimagick/minimagick/issues/515
end
