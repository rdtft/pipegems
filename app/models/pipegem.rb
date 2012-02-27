class Pipegem < ActiveRecord::Base
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
