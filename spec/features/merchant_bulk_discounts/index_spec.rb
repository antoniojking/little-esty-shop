require 'rails_helper'

RSpec.describe 'Merchant Bulk Discounts Index Page' do
  # As a merchant
  # When I visit my merchant dashboard
  # Then I see a link to view all my discounts
  # When I click this link
  # Then I am taken to my bulk discounts index page
  # Where I see all of my bulk discounts including their
  # percentage discount and quantity thresholds
  # And each bulk discount listed includes a link to its show page
  it 'displays list of bulk discounts associated with the merchant along with attributes' do
    visit merchant_bulk_discounts_path(@merchant1.id)

    within("#bd-#{@bulk_discount1.id}") do
      expect(page).to have_content(@bulk_discount1.percentage_discount)
      expect(page).to have_content(@bulk_discount1.quantity_threshold)
    end

    within("#bd-#{@bulk_discount2.id}") do
      expect(page).to have_content(@bulk_discount2.percentage_discount)
      expect(page).to have_content(@bulk_discount2.quantity_threshold)
    end

    within("#bd-#{@bulk_discount3.id}") do
      expect(page).to have_content(@bulk_discount3.percentage_discount)
      expect(page).to have_content(@bulk_discount3.quantity_threshold)
    end
  end

  it 'has links to each bulk discounts show page' do
    visit merchant_bulk_discounts_path(@merchant1.id)

    within("#bd-#{@bulk_discount1.id}") do
      expect(page).to have_link("#{@bulk_discount1.id}")
    end

    within("#bd-#{@bulk_discount2.id}") do
      expect(page).to have_link("#{@bulk_discount2.id}")
    end

    within("#bd-#{@bulk_discount3.id}") do
      expect(page).to have_link("#{@bulk_discount3.id}")
    end
  end

  it 'will redirect to the bulk discount show page upon clicking the link' do
    visit merchant_bulk_discounts_path(@merchant1.id)

    click_link("#{@bulk_discount1.id}")

    expect(current_path).to eq(merchant_bulk_discount_path(@merchant1.id, @bulk_discount1.id))
  end

  # As a merchant
  # When I visit my bulk discounts index
  # Then I see a link to create a new discount
  # When I click this link
  # Then I am taken to a new page where I see a form to add a new bulk discount
  # When I fill in the form with valid data
  # Then I am redirected back to the bulk discount index
  # And I see my new bulk discount listed
  it 'has a link to create a new discount' do
    visit merchant_bulk_discounts_path(@merchant1.id)

    expect(page).to have_link("Create a New Discount")
  end

  it 'takes me to a form to create a new discount' do
    visit merchant_bulk_discounts_path(@merchant1.id)

    click_link("Create a New Discount")

    expect(current_path).to eq(new_merchant_bulk_discount_path(@merchant1.id))
  end
end
