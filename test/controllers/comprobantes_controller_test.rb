require 'test_helper'

class ComprobantesControllerTest < ActionController::TestCase
  setup do
    @comprobante = comprobantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comprobantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comprobante" do
    assert_difference('Comprobante.count') do
      post :create, comprobante: { comprobantable_id: @comprobante.comprobantable_id, comprobantable_type: @comprobante.comprobantable_type, fecha: @comprobante.fecha, numeroserie: @comprobante.numeroserie, observation: @comprobante.observation, type: @comprobante.type }
    end

    assert_redirected_to comprobante_path(assigns(:comprobante))
  end

  test "should show comprobante" do
    get :show, id: @comprobante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comprobante
    assert_response :success
  end

  test "should update comprobante" do
    patch :update, id: @comprobante, comprobante: { comprobantable_id: @comprobante.comprobantable_id, comprobantable_type: @comprobante.comprobantable_type, fecha: @comprobante.fecha, numeroserie: @comprobante.numeroserie, observation: @comprobante.observation, type: @comprobante.type }
    assert_redirected_to comprobante_path(assigns(:comprobante))
  end

  test "should destroy comprobante" do
    assert_difference('Comprobante.count', -1) do
      delete :destroy, id: @comprobante
    end

    assert_redirected_to comprobantes_path
  end
end
