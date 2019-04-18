require 'test_helper'

class ListOfMapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list_of_map = list_of_maps(:one)
  end

  test "should get index" do
    get list_of_maps_url
    assert_response :success
  end

  test "should get new" do
    get new_list_of_map_url
    assert_response :success
  end

  test "should create list_of_map" do
    assert_difference('ListOfMap.count') do
      post list_of_maps_url, params: { list_of_map: { map_id: @list_of_map.map_id, rock_glacier: @list_of_map.rock_glacier, user_id: @list_of_map.user_id } }
    end

    assert_redirected_to list_of_map_url(ListOfMap.last)
  end

  test "should show list_of_map" do
    get list_of_map_url(@list_of_map)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_of_map_url(@list_of_map)
    assert_response :success
  end

  test "should update list_of_map" do
    patch list_of_map_url(@list_of_map), params: { list_of_map: { map_id: @list_of_map.map_id, rock_glacier: @list_of_map.rock_glacier, user_id: @list_of_map.user_id } }
    assert_redirected_to list_of_map_url(@list_of_map)
  end

  test "should destroy list_of_map" do
    assert_difference('ListOfMap.count', -1) do
      delete list_of_map_url(@list_of_map)
    end

    assert_redirected_to list_of_maps_url
  end
end
