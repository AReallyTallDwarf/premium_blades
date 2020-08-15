require 'test_helper'

class BladesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blade = blades(:one)
  end

  test "should get index" do
    get blades_url
    assert_response :success
  end

  test "should get new" do
    get new_blade_url
    assert_response :success
  end

  test "should create blade" do
    assert_difference('Blade.count') do
      post blades_url, params: { blade: {  } }
    end

    assert_redirected_to blade_url(Blade.last)
  end

  test "should show blade" do
    get blade_url(@blade)
    assert_response :success
  end

  test "should get edit" do
    get edit_blade_url(@blade)
    assert_response :success
  end

  test "should update blade" do
    patch blade_url(@blade), params: { blade: {  } }
    assert_redirected_to blade_url(@blade)
  end

  test "should destroy blade" do
    assert_difference('Blade.count', -1) do
      delete blade_url(@blade)
    end

    assert_redirected_to blades_url
  end
end
