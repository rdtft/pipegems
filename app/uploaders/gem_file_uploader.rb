# encoding: utf-8

class GemFileUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    'gems'
  end
end
