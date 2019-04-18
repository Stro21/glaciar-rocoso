require "application_system_test_case"

class ListOfMapsTest < ApplicationSystemTestCase
  setup do
    @list_of_map = list_of_maps(:one)
  end

  test "visiting the index" do
    visit list_of_maps_url
    assert_selector "h1", text: "List Of Maps"
  end

  test "creating a List of map" do
    visit list_of_maps_url
    click_on "New List Of Map"

    fill_in "Map", with: @list_of_map.map_id
    fill_in "Rock glacier", with: @list_of_map.rock_glacier
    fill_in "User", with: @list_of_map.user_id
    click_on "Create List of map"

    assert_text "List of map was successfully created"
    click_on "Back"
  end

  test "updating a List of map" do
    visit list_of_maps_url
    click_on "Edit", match: :first

    fill_in "Map", with: @list_of_map.map_id
    fill_in "Rock glacier", with: @list_of_map.rock_glacier
    fill_in "User", with: @list_of_map.user_id
    click_on "Update List of map"

    assert_text "List of map was successfully updated"
    click_on "Back"
  end

  test "destroying a List of map" do
    visit list_of_maps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "List of map was successfully destroyed"
  end
end
