class Rubygem < ActiveRecord::Base
  belongs_to :user
  has_many :rubygem_versions
end
