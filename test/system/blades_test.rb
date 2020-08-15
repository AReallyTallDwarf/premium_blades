require "application_system_test_case"

class BladesTest < ApplicationSystemTestCase
  setup do
    @blade = blades(:one)
  end

  test "visiting the index" do
    visit blades_url
    assert_selector "h1", text: "Blades"
  end

  test "creating a Blade" do
    visit blades_url
    click_on "New Blade"

    click_on "Create Blade"

    assert_text "Blade was successfully created"
    click_on "Back"
  end

  test "updating a Blade" do
    visit blades_url
    click_on "Edit", match: :first

    click_on "Update Blade"

    assert_text "Blade was successfully updated"
    click_on "Back"
  end

  test "destroying a Blade" do
    visit blades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blade was successfully destroyed"
  end
end
