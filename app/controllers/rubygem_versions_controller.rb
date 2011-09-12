class RubygemVersionsController < InheritedResources::Base
  belongs_to :rubygem
  actions :index, :show, :new, :create
  load_and_authorize_resource

  def new
    3.times do
      @rubygem_version.rubygem_files.build
    end
    new!
  end

end
