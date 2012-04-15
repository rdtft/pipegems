class VersionFile < ActiveRecord::Base
  mount_uploader :file, VersionFileUploader
end
