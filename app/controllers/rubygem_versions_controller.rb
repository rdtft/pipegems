class RubygemVersionsController < InheritedResources::Base
  belongs_to :rubygem
  actions :index, :show, :new, :create
  load_and_authorize_resource
end
