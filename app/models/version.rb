class Version < ActiveRecord::Base
  validates :name, :presence   => true,
                   :uniqueness => { :scope => :pipegem_id }
end
