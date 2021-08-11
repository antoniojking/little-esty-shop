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
    # expect(page).to_not have_content(@bulk_discount2.quantity_threshold)
  end

  # As a merchant
  # When I visit my bulk discount show page
  # Then I see a link to edit the bulk discount
  # When I click this link
  # Then I am taken to a new page with a form to edit the discount
  # And I see that the discounts current attributes are pre-poluated in the form
  # When I change any/all of the information and click submit
  # Then I am redirected to the bulk discount's show page
  # And I see that the discount's attributes have been updated
  it 'has a link that redirects user to an edit form for changing the bulk discount attributes' do
    visit merchant_bulk_discount_path(@merchant1.id, @bulk_discount1.id)

    expect(page).to have_link("Edit this Discount")

    click_link("Edit this Discount")

    expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant1.id, @bulk_discount1.id))
  end
end
