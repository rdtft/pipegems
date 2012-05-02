class Pipegem < ActiveRecord::Base
  has_many :versions, :dependent => :destroy

  strip_attributes :only => :name
  before_validation :name_delete_prefix

  validates :name, :presence   => true,
                   :uniqueness => { :case_sensitive => false }

  def name_delete_prefix
    self.name.try(:sub!, /\Apipe-/i, '')
  end
end
