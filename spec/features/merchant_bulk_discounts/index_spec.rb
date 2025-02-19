require 'rails_helper'

RSpec.describe 'Merchant Bulk Discounts Index Page' do
  describe 'attributes and links' do
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
  end

  describe 'Upcoming holidays api' do
    # As a merchant
    # When I visit the discounts index page
    # I see a section with a header of "Upcoming Holidays"
    # In this section the name and date of the next 3 upcoming US holidays are listed.
    xit 'lists the name and date of the next 3 upcoming US holidays' do
      visit merchant_bulk_discounts_path(@merchant1.id)

      expect(page).to have_content("Upcoming Holidays")

      within("#Holidays") do
        expect(page).to have_content("Labour Day")
        expect(page).to have_content("2021-09-06")
        expect(page).to have_content("Columbus Day")
        expect(page).to have_content("2021-10-11")
        expect(page).to have_content("Veterans Day")
        expect(page).to have_content("2021-11-11")
      end
    end
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

  # As a merchant
  # When I visit my bulk discounts index
  # Then next to each bulk discount I see a link to delete it
  # When I click this link
  # Then I am redirected back to the bulk discounts index page
  # And I no longer see the discount listed
  it 'has a link to delete a bulk discount and can delete the discount' do
    visit merchant_bulk_discounts_path(@merchant1.id)

    within("#bd-#{@bulk_discount1.id}") do
      expect(page).to have_link("Delete this Discount")
    end

    within("#bd-#{@bulk_discount2.id}") do
      expect(page).to have_link("Delete this Discount")
    end

    within("#bd-#{@bulk_discount3.id}") do
      expect(page).to have_link("Delete this Discount")
    end

    within("#bd-#{@bulk_discount1.id}") do
      click_link("Delete this Discount")
    end

    expect(page).to_not have_link("#{@bulk_discount1.id}")
    expect(page).to_not have_content("#{@bulk_discount1.percentage_discount}% Discount")
    expect(page).to_not have_content("Purchase of #{@bulk_discount1.quantity_threshold} or more")
  end
end
