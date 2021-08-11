require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'relationships' do
    it { should belong_to(:item) }
    it { should belong_to(:invoice) }
    # it { should have_many(:) }
    # it { should have_many(:).through(:) }
  end

  describe 'enum status' do
    it { should define_enum_for(:status).with_values([:pending, :packaged, :shipped]) }
  end

  # describe 'validations' do
  #   it { should validate_presence_of(:) }
  # end

  # before :each do

  # end

  describe 'class methods' do
    describe '.locate' do
      it 'locates invoice item with invoice and item ids' do
        expected = InvoiceItem.locate(@invoice1.id, @item1.id)

        expect(expected).to eq(@invoice_item1)
      end
    end

    describe '.total_revenue' do
      it 'calculates total revenue of a collection of invoice items' do
        expected = @invoice1.invoice_items.total_revenue

        expect(expected).to eq(78750)
      end
    end
  end

  describe 'discounts' do
    it 'determines discount for an invoive item' do
      invoice_item22 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item5.id, quantity: 1, unit_price: @item5.unit_price, status: 'shipped')
      invoice_item23 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item17.id, quantity: 10, unit_price: @item17.unit_price, status: 'shipped')

      expect(@invoice_item1.find_item_discount).to eq(@bulk_discount4)
      expect(@invoice_item15.find_item_discount).to eq(@bulk_discount2)
      expect(@invoice_item16.find_item_discount).to eq(@bulk_discount5)
      expect(invoice_item23.find_item_discount).to eq(@bulk_discount1)
      expect(invoice_item22.find_item_discount).to eq(nil)
    end

    it 'calculates discounted revenue for a collection of invoice items' do
      invoice_item22 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item5.id, quantity: 1, unit_price: @item5.unit_price, status: 'shipped')
      invoice_item23 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item17.id, quantity: 10, unit_price: @item17.unit_price, status: 'shipped')
      
      expect(@invoice1.invoice_items.discounted_revenue).to eq(82562.5)
    end
  end

  # describe 'instance methods' do
  #   describe '#' do
  #   end
  # end
end
