require 'test_helper'

class BusModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_model = bus_models(:one)
  end

  test "should get index" do
    get bus_models_url
    assert_response :success
  end

  test "should get new" do
    get new_bus_model_url
    assert_response :success
  end

  test "should create bus_model" do
    assert_difference('BusModel.count') do
      post bus_models_url, params: { bus_model: { brand: @bus_model.brand } }
    end

    assert_redirected_to bus_model_url(BusModel.last)
  end

  test "should show bus_model" do
    get bus_model_url(@bus_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_bus_model_url(@bus_model)
    assert_response :success
  end

  test "should update bus_model" do
    patch bus_model_url(@bus_model), params: { bus_model: { brand: @bus_model.brand } }
    assert_redirected_to bus_model_url(@bus_model)
  end

  test "should destroy bus_model" do
    assert_difference('BusModel.count', -1) do
      delete bus_model_url(@bus_model)
    end

    assert_redirected_to bus_models_url
  end
end
