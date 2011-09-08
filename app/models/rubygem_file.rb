class RubygemFile < ActiveRecord::Base
  belongs_to :rubygem_version
  mount_uploader :file, RubygemFileUploader
end
