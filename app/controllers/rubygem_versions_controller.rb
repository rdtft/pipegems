class RubygemVersionsController < InheritedResources::Base
  belongs_to :rubygem
  actions :index, :show, :new, :create
end
