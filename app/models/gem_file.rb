class GemFile < ActiveRecord::Base
  belongs_to :rubygem_version
  mount_uploader :file, GemFileUploader
end
