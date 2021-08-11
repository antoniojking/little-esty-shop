require 'rails_helper'

RSpec.describe Invoice do
  describe 'relationships' do
    it { should have_many(:transactions) }
    it { should have_many(:invoice_items) }
    it { should belong_to(:customer) }
    it { should have_many(:items).through(:invoice_items) }
  end

  describe 'validations' do
    context 'status' do
      it { should validate_presence_of(:status) }
      it { should define_enum_for(:status).with_values([:in_progress, :completed, :cancelled]) }
    end
  end

  it 'calculates invoice total revenue' do
    expect(@invoice1.invoice_items.count).to eq(3)
    expect(@invoice1.total_revenue).to eq(78750)
  end

  it 'returns list of invoices from old to new with invoice_items that have not been shipped' do
    expect(Invoice.incomplete_invoices_by_date.length).to eq(13)
  end

  it 'calculates invoice discounted revenue' do
    invoice_item22 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item5.id, quantity: 1, unit_price: @item5.unit_price, status: 'shipped')
    invoice_item23 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item17.id, quantity: 10, unit_price: @item17.unit_price, status: 'shipped')

    expect(@invoice1.invoice_items.count).to eq(5)
    expect(@invoice1.discounted_revenue).to eq(57562.5)
  end
end
