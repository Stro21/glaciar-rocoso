require "application_system_test_case"

class MaplistsTest < ApplicationSystemTestCase
  setup do
    @maplist = maplists(:one)
  end

  test "visiting the index" do
    visit maplists_url
    assert_selector "h1", text: "Maplists"
  end

  test "creating a Maplist" do
    visit maplists_url
    click_on "New Maplist"

    check "Glaciar rock" if @maplist.glaciar_rock
    fill_in "Map", with: @maplist.map_id
    fill_in "User", with: @maplist.user_id
    click_on "Create Maplist"

    assert_text "Maplist was successfully created"
    click_on "Back"
  end

  test "updating a Maplist" do
    visit maplists_url
    click_on "Edit", match: :first

    check "Glaciar rock" if @maplist.glaciar_rock
    fill_in "Map", with: @maplist.map_id
    fill_in "User", with: @maplist.user_id
    click_on "Update Maplist"

    assert_text "Maplist was successfully updated"
    click_on "Back"
  end

  test "destroying a Maplist" do
    visit maplists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Maplist was successfully destroyed"
  end
end
