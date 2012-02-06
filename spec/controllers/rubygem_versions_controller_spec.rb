require 'spec_helper'

describe RubygemVersionsController do

  let(:rubygem_version) { Fabricate(:rubygem_version) }
  let(:rubygem)         { rubygem_version.rubygem }
  let(:user)            { rubygem.user }

  it 'should get index' do
    get :index, rubygem_id: rubygem.id
    response.should be_success
  end

  it 'should get new' do
    sign_in user
    get :new, rubygem_id: rubygem.id
    response.should be_success
  end

  it 'should create rubygem version' do
    sign_in user
    rubygem_version = Fabricate.build(:rubygem_version, rubygem: rubygem)

    lambda do
      post :create,
        rubygem_id:      rubygem.id,
        rubygem_version: rubygem_version.attributes
    end.should change(RubygemVersion, :count).by(1)

    response.should redirect_to(rubygem_path(rubygem))
  end

  it 'should show rubygem version' do
    get :show, rubygem_id: rubygem.id, id: rubygem_version.to_param
    response.should be_success
  end

  it 'should not respond to edit' do
    lambda do
      get :edit,
        rubygem_id: rubygem.id,
        id:         rubygem_version.to_param
    end.should raise_error(ActionController::UnknownAction)
  end

  it 'should not response to update' do
    lambda do
      put :update,
        id:              rubygem_version.id,
        rubygem_id:      rubygem.id,
        rubygem_version: rubygem_version.attributes
    end.should raise_error(ActionController::UnknownAction)
  end

  it 'should not response to destroy' do
    lambda do
      delete :destroy,
        rubygem_id: rubygem.id,
        id:         rubygem_version.id
    end.should raise_error(ActionController::UnknownAction)
  end
end
