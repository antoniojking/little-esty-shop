require 'rails_helper'

RSpec.describe 'Merchant Bulk Discounts New Page' do
  # As a merchant
  # When I visit my bulk discounts index
  # Then I see a link to create a new discount
  # When I click this link
  # Then I am taken to a new page where I see a form to add a new bulk discount
  # When I fill in the form with valid data
  # Then I am redirected back to the bulk discount index
  # And I see my new bulk discount listed
  it 'has a form to create a new discount' do
    visit new_merchant_bulk_discount_path(@merchant1.id)

    fill_in :percentage_discount, with: 50
    fill_in :quantity_threshold, with: 50
    click_on "Submit"
    
    expect(current_path).to eq(merchant_bulk_discounts_path(@merchant1.id))
    expect(page).to have_content("50% Discount")
    expect(page).to have_content("Purchase of 50 or more")
  end
end
