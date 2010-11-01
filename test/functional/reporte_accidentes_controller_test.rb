require 'test_helper'

class ReporteAccidentesControllerTest < ActionController::TestCase
  setup do
    @reporte_accidente = reporte_accidentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reporte_accidentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reporte_accidente" do
    assert_difference('ReporteAccidente.count') do
      post :create, :reporte_accidente => @reporte_accidente.attributes
    end

    assert_redirected_to reporte_accidente_path(assigns(:reporte_accidente))
  end

  test "should show reporte_accidente" do
    get :show, :id => @reporte_accidente.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reporte_accidente.to_param
    assert_response :success
  end

  test "should update reporte_accidente" do
    put :update, :id => @reporte_accidente.to_param, :reporte_accidente => @reporte_accidente.attributes
    assert_redirected_to reporte_accidente_path(assigns(:reporte_accidente))
  end

  test "should destroy reporte_accidente" do
    assert_difference('ReporteAccidente.count', -1) do
      delete :destroy, :id => @reporte_accidente.to_param
    end

    assert_redirected_to reporte_accidentes_path
  end
end
