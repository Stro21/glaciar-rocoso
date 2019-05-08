require 'test_helper'

class MaplistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maplist = maplists(:one)
  end

  test "should get index" do
    get maplists_url
    assert_response :success
  end

  test "should get new" do
    get new_maplist_url
    assert_response :success
  end

  test "should create maplist" do
    assert_difference('Maplist.count') do
      post maplists_url, params: { maplist: { glaciar_rock: @maplist.glaciar_rock, map_id: @maplist.map_id, user_id: @maplist.user_id } }
    end

    assert_redirected_to maplist_url(Maplist.last)
  end

  test "should show maplist" do
    get maplist_url(@maplist)
    assert_response :success
  end

  test "should get edit" do
    get edit_maplist_url(@maplist)
    assert_response :success
  end

  test "should update maplist" do
    patch maplist_url(@maplist), params: { maplist: { glaciar_rock: @maplist.glaciar_rock, map_id: @maplist.map_id, user_id: @maplist.user_id } }
    assert_redirected_to maplist_url(@maplist)
  end

  test "should destroy maplist" do
    assert_difference('Maplist.count', -1) do
      delete maplist_url(@maplist)
    end

    assert_redirected_to maplists_url
  end
end
