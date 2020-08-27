require "application_system_test_case"

class CotizacionsTest < ApplicationSystemTestCase
  setup do
    @cotizacion = cotizacions(:one)
  end

  test "visiting the index" do
    visit cotizacions_url
    assert_selector "h1", text: "Cotizacions"
  end

  test "creating a Cotizacion" do
    visit cotizacions_url
    click_on "New Cotizacion"

    fill_in "Num cotizacion", with: @cotizacion.num_cotizacion
    fill_in "Solicitud", with: @cotizacion.solicitud_id
    click_on "Create Cotizacion"

    assert_text "Cotizacion was successfully created"
    click_on "Back"
  end

  test "updating a Cotizacion" do
    visit cotizacions_url
    click_on "Edit", match: :first

    fill_in "Num cotizacion", with: @cotizacion.num_cotizacion
    fill_in "Solicitud", with: @cotizacion.solicitud_id
    click_on "Update Cotizacion"

    assert_text "Cotizacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Cotizacion" do
    visit cotizacions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cotizacion was successfully destroyed"
  end
end
