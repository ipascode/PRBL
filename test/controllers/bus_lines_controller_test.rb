require 'test_helper'

class BusLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_line = bus_lines(:one)
  end

  test "should get index" do
    get bus_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_bus_line_url
    assert_response :success
  end

  test "should create bus_line" do
    assert_difference('BusLine.count') do
      post bus_lines_url, params: { bus_line: { distance: @bus_line.distance, linename: @bus_line.linename } }
    end

    assert_redirected_to bus_line_url(BusLine.last)
  end

  test "should show bus_line" do
    get bus_line_url(@bus_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_bus_line_url(@bus_line)
    assert_response :success
  end

  test "should update bus_line" do
    patch bus_line_url(@bus_line), params: { bus_line: { distance: @bus_line.distance, linename: @bus_line.linename } }
    assert_redirected_to bus_line_url(@bus_line)
  end

  test "should destroy bus_line" do
    assert_difference('BusLine.count', -1) do
      delete bus_line_url(@bus_line)
    end

    assert_redirected_to bus_lines_url
  end
end
