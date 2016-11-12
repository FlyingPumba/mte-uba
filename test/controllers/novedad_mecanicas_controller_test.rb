require 'test_helper'

class NovedadMecanicasControllerTest < ActionController::TestCase
  setup do
    @novedad_mecanica = novedad_mecanicas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:novedad_mecanicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create novedad_mecanica" do
    assert_difference('NovedadMecanica.count') do
      post :create, novedad_mecanica: { fecha: @novedad_mecanica.fecha, observacion: @novedad_mecanica.observacion }
    end

    assert_redirected_to novedad_mecanica_path(assigns(:novedad_mecanica))
  end

  test "should show novedad_mecanica" do
    get :show, id: @novedad_mecanica
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @novedad_mecanica
    assert_response :success
  end

  test "should update novedad_mecanica" do
    patch :update, id: @novedad_mecanica, novedad_mecanica: { fecha: @novedad_mecanica.fecha, observacion: @novedad_mecanica.observacion }
    assert_redirected_to novedad_mecanica_path(assigns(:novedad_mecanica))
  end

  test "should destroy novedad_mecanica" do
    assert_difference('NovedadMecanica.count', -1) do
      delete :destroy, id: @novedad_mecanica
    end

    assert_redirected_to novedad_mecanicas_path
  end
end
