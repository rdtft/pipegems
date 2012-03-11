class Version < ActiveRecord::Base
  before_validation :name_strip_whitespaces
  
  validates :name, :presence   => true,
                   :uniqueness => { :scope => :pipegem_id },
                   :format     => { :with => /\Av?[0-9]+(\.[0-9a-zA-Z]+)*\z/ } # https://github.com/rubygems/rubygems/blob/master/lib/rubygems/version.rb#L150

  after_validation :name_normalize_prefix
  

  def name_strip_whitespaces
    name_copy = self.name
    name_copy.strip! if name_copy.present?
    self.name = name_copy
  end

  def name_normalize_prefix
    name_copy = self.name

    if name_copy.present?
      prefix = 'v'
      name_copy.insert(0, prefix) unless name_copy[0].eql? prefix
    end

    self.name = name_copy
  end
end
