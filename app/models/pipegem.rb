class Pipegem < ActiveRecord::Base
  has_many :versions, :dependent => :destroy
  
  before_validation :normalize_name
  
  validates :name, :presence   => true,
                   :uniqueness => true
                   
  def normalize_name
    name_copy = self.name

    if name_copy.present?
      name_copy.strip!

      pipe = 'pipe-'
      prefix = /^#{pipe}/

      if name_copy == pipe
        name_copy.clear
      else
        name_copy = "#{pipe}#{name_copy}" unless name_copy =~ prefix
      end
    end

    self.name = name_copy
  end
end
