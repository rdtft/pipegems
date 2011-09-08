require 'test_helper'

class RubygemVersionsControllerTest < ActionController::TestCase
  setup do
    @rubygem_version = rubygem_versions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rubygem_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rubygem_version" do
    assert_difference('RubygemVersion.count') do
      post :create, rubygem_version: @rubygem_version.attributes
    end

    assert_redirected_to rubygem_version_path(assigns(:rubygem_version))
  end

  test "should show rubygem_version" do
    get :show, id: @rubygem_version.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rubygem_version.to_param
    assert_response :success
  end

  test "should update rubygem_version" do
    put :update, id: @rubygem_version.to_param, rubygem_version: @rubygem_version.attributes
    assert_redirected_to rubygem_version_path(assigns(:rubygem_version))
  end

  test "should destroy rubygem_version" do
    assert_difference('RubygemVersion.count', -1) do
      delete :destroy, id: @rubygem_version.to_param
    end

    assert_redirected_to rubygem_versions_path
  end
end
