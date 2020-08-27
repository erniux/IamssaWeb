require 'test_helper'

class CotizacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cotizacion = cotizacions(:one)
  end

  test "should get index" do
    get cotizacions_url
    assert_response :success
  end

  test "should get new" do
    get new_cotizacion_url
    assert_response :success
  end

  test "should create cotizacion" do
    assert_difference('Cotizacion.count') do
      post cotizacions_url, params: { cotizacion: { num_cotizacion: @cotizacion.num_cotizacion, solicitud_id: @cotizacion.solicitud_id } }
    end

    assert_redirected_to cotizacion_url(Cotizacion.last)
  end

  test "should show cotizacion" do
    get cotizacion_url(@cotizacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_cotizacion_url(@cotizacion)
    assert_response :success
  end

  test "should update cotizacion" do
    patch cotizacion_url(@cotizacion), params: { cotizacion: { num_cotizacion: @cotizacion.num_cotizacion, solicitud_id: @cotizacion.solicitud_id } }
    assert_redirected_to cotizacion_url(@cotizacion)
  end

  test "should destroy cotizacion" do
    assert_difference('Cotizacion.count', -1) do
      delete cotizacion_url(@cotizacion)
    end

    assert_redirected_to cotizacions_url
  end
end
