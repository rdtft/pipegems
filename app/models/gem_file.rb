class GemFile < ActiveRecord::Base
  belongs_to :rubygems_version
end
