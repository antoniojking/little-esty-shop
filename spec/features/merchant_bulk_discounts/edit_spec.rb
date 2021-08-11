require 'rails_helper'

RSpec.describe 'Merchant Bulk Discounts Edit Page' do
  # As a merchant
  # When I visit my bulk discount show page
  # Then I see a link to edit the bulk discount
  # When I click this link
  # Then I am taken to a new page with a form to edit the discount
  # And I see that the discounts current attributes are pre-poluated in the form
  # When I change any/all of the information and click submit
  # Then I am redirected to the bulk discount's show page
  # And I see that the discount's attributes have been updated
  it 'has a forms for changing the bulk discount attributes' do
    visit edit_merchant_bulk_discount_path(@merchant1.id, @bulk_discount1.id)

    expect(page).to have_field(:percentage_discount, with: @bulk_discount1.percentage_discount)
    expect(page).to have_field(:quantity_threshold, with: @bulk_discount1.quantity_threshold)

    new_percentage = 25
    new_quantity = 12

    fill_in :percentage_discount, with: new_percentage
    fill_in :quantity_threshold, with: new_quantity
    click_on("Update Discount")

    expect(current_path).to eq(merchant_bulk_discount_path(@merchant1.id, @bulk_discount1.id))
    expect(page).to have_content("#{new_percentage}% Discount")
    expect(page).to have_content("Purchase of #{new_quantity} or more")

    expect(page).to_not have_content("#{@bulk_discount1.percentage_discount}% Discount")
    expect(page).to_not have_content("Purchase of #{@bulk_discount1.quantity_threshold} or more")
  end
end
