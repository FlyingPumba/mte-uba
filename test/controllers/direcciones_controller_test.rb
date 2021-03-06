require 'test_helper'

class DireccionsControllerTest < ActionController::TestCase
  setup do
    @direccion = direcciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:direcciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create direccion" do
    assert_difference('Direccion.count') do
      post :create, direccion: { altura: @direccion.altura, calle: @direccion.calle, direccionable_id: @direccion.direccionable_id, direccionable_type: @direccion.direccionable_type }
    end

    assert_redirected_to direccion_path(assigns(:direccion))
  end

  test "should show direccion" do
    get :show, id: @direccion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @direccion
    assert_response :success
  end

  test "should update direccion" do
    patch :update, id: @direccion, direccion: { altura: @direccion.altura, calle: @direccion.calle, direccionable_id: @direccion.direccionable_id, direccionable_type: @direccion.direccionable_type }
    assert_redirected_to direccion_path(assigns(:direccion))
  end

  test "should destroy direccion" do
    assert_difference('Direccion.count', -1) do
      delete :destroy, id: @direccion
    end

    assert_redirected_to direcciones_path
  end
end
