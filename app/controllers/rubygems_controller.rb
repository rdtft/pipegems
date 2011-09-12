class RubygemsController < InheritedResources::Base
  actions :index, :show, :new, :create
  before_filter lambda { resource.user = current_user }, :only => :create
end
