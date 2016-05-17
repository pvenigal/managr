require 'test_helper'

class ComposesControllerTest < ActionController::TestCase
  setup do
    @compose = composes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:composes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compose" do
    assert_difference('Compose.count') do
      post :create, compose: { email: @compose.email, message: @compose.message, name: @compose.name, subject: @compose.subject }
    end

    assert_redirected_to compose_path(assigns(:compose))
  end

  test "should show compose" do
    get :show, id: @compose
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compose
    assert_response :success
  end

  test "should update compose" do
    patch :update, id: @compose, compose: { email: @compose.email, message: @compose.message, name: @compose.name, subject: @compose.subject }
    assert_redirected_to compose_path(assigns(:compose))
  end

  test "should destroy compose" do
    assert_difference('Compose.count', -1) do
      delete :destroy, id: @compose
    end

    assert_redirected_to composes_path
  end
end
