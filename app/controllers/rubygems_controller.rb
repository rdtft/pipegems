class RubygemsController < InheritedResources::Base
  actions :index, :show, :new, :create
  load_and_authorize_resource

  protected

    def begin_of_association_chain
      params[:action] == 'create' ? current_user : nil
    end
end
