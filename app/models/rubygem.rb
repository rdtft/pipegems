class Rubygem < ActiveRecord::Base
  belongs_to :user
  has_many :rubygem_versions

  validates :name, :presence => true, :uniqueness => true

  def lib_name
    "pipe-#{name.downcase}"
  end

  def class_name
    name.classify
  end
end
