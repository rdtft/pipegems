require 'spec_helper'

describe RubygemsController do

  let(:rubygem) { Fabricate(:rubygem) }
  let(:user)    { rubygem.user }

  it 'should get index' do
    get :index
    response.should be_success
  end

  it 'should get new' do
    sign_in user
    get :new
    response.should be_success
  end

  it 'should create rubygem' do
    sign_in user
    rubygem = Fabricate.build(:rubygem, user: user)

    lambda do
      post :create, rubygem: rubygem.attributes
    end.should change(Rubygem, :count).by(1)

    response.should redirect_to(rubygem_path(Rubygem.last))
  end

  it 'should show rubygem' do
    get :show, id: rubygem.to_param
    response.should be_success
  end

  it 'should not response to edit' do
    lambda do
      get :edit, id: rubygem.id
    end.should raise_error(AbstractController::ActionNotFound)
  end

  it 'should not response to update' do
    lambda do
      put :update, id: rubygem.id
    end.should raise_error(AbstractController::ActionNotFound)
  end

  it 'should not response to destroy' do
    lambda do
      delete :update, id: rubygem.id
    end.should raise_error(AbstractController::ActionNotFound)
  end
end
