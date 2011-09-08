class RubygemVersion < ActiveRecord::Base
  belongs_to :rubygem
  has_many :rubygem_files, :dependent => :destroy

  accepts_nested_attributes_for :rubygem_files, :allow_destroy => true
end
