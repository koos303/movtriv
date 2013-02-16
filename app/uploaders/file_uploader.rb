# encoding: utf-8
class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(png)
  end

  version :resized do
    process :resize_to_limit => [1024, 768]
  end
end
