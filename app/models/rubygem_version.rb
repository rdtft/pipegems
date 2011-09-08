class RubygemVersion < ActiveRecord::Base
  belongs_to :rubygem
  has_many :rubygem_files
end
