require 'test_helper'

class SphinxesControllerTest < ActionController::TestCase
  setup do
    @sphinx = sphinxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sphinxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sphinx" do
    assert_difference('Sphinx.count') do
      post :create, sphinx: { log_file_path: @sphinx.log_file_path, name: @sphinx.name, weight: @sphinx.weight }
    end

    assert_redirected_to sphinx_path(assigns(:sphinx))
  end

  test "should show sphinx" do
    get :show, id: @sphinx
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sphinx
    assert_response :success
  end

  test "should update sphinx" do
    put :update, id: @sphinx, sphinx: { log_file_path: @sphinx.log_file_path, name: @sphinx.name, weight: @sphinx.weight }
    assert_redirected_to sphinx_path(assigns(:sphinx))
  end

  test "should destroy sphinx" do
    assert_difference('Sphinx.count', -1) do
      delete :destroy, id: @sphinx
    end

    assert_redirected_to sphinxes_path
  end
end
