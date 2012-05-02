class Version < ActiveRecord::Base
  has_many :version_files, :dependent => :destroy

  strip_attributes :only => :name
  before_validation :name_delete_prefix

  validates :name, :presence   => true,
                   :uniqueness => { :scope => :pipegem_id },
                   :format     => { :with => /\A[0-9]+(\.[0-9a-zA-Z]+)*\z/ }
                   # https://github.com/rubygems/rubygems/blob/master/lib/rubygems/version.rb#L150

  def name_delete_prefix
    self.name.try(:sub!, /\Av/i, '')
  end
end
