require 'rails_helper'

RSpec.describe 'Merchant Bulk Discounts Show Page' do
  # As a merchant
  # When I visit my bulk discount show page
  # Then I see the bulk discount's quantity threshold and percentage discount
  it 'displays the attributes of the bulk discount associated with the merchant' do
    visit merchant_bulk_discount_path(@merchant1.id, @bulk_discount1.id)

    expect(page).to have_content(@bulk_discount1.id)
    expect(page).to have_content(@bulk_discount1.percentage_discount)
    expect(page).to have_content(@bulk_discount1.quantity_threshold)

    expect(page).to_not have_content(@bulk_discount2.id)
    expect(page).to_not have_content(@bulk_discount2.percentage_discount)
    expect(page).to_not have_content(@bulk_discount2.quantity_threshold)
  end
end
