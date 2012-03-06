class Pipegem < ActiveRecord::Base
  has_many :versions, :dependent => :destroy
  
  before_validation :normalize_name
  
  validates :name, :presence   => true,
                   :uniqueness => true
                   
  def normalize_name
    name = self.name
    
    name.strip!
    
    pipe = 'pipe-'
    prefix = /^#{pipe}/
    if name == pipe
      name.clear
    else
      name = "#{pipe}#{name}" unless name =~ prefix
    end
    
    self.name = name
  end
end
