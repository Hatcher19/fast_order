require "application_system_test_case"

class LineItemsTest < ApplicationSystemTestCase
  setup do
    @line_item = line_items(:one)
  end

  test "visiting the index" do
    visit line_items_url
    assert_selector "h1", text: "Line Items"
  end

  test "creating a Line item" do
    visit line_items_url
    click_on "New Line Item"

    fill_in "Division", with: @line_item.division
    fill_in "Inkcolor", with: @line_item.inkcolor
    fill_in "League", with: @line_item.league
    fill_in "Order", with: @line_item.order_id
    fill_in "Quantity", with: @line_item.quantity
    fill_in "Shirtcolor", with: @line_item.shirtcolor
    fill_in "Shirtsize", with: @line_item.shirtsize
    fill_in "Team", with: @line_item.team
    fill_in "User", with: @line_item.user_id
    click_on "Create Line item"

    assert_text "Line item was successfully created"
    click_on "Back"
  end

  test "updating a Line item" do
    visit line_items_url
    click_on "Edit", match: :first

    fill_in "Division", with: @line_item.division
    fill_in "Inkcolor", with: @line_item.inkcolor
    fill_in "League", with: @line_item.league
    fill_in "Order", with: @line_item.order_id
    fill_in "Quantity", with: @line_item.quantity
    fill_in "Shirtcolor", with: @line_item.shirtcolor
    fill_in "Shirtsize", with: @line_item.shirtsize
    fill_in "Team", with: @line_item.team
    fill_in "User", with: @line_item.user_id
    click_on "Update Line item"

    assert_text "Line item was successfully updated"
    click_on "Back"
  end

  test "destroying a Line item" do
    visit line_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Line item was successfully destroyed"
  end
end
