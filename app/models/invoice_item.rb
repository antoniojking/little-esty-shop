class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  enum status: [:pending, :packaged, :shipped]

  def self.locate(invoice_id, item_id)
    where('invoice_id = ?', invoice_id).where('item_id = ?', item_id).first
  end

  def self.total_revenue
    sum("quantity * unit_price")
  end

  def find_item_discount
    item.merchant.bulk_discounts.where('quantity_threshold <= ?', quantity)
                                .order(percentage_discount: :desc)
                                .first
  end

  def discounted_revenue
    if find_item_discount.nil?
      quantity * unit_price
    else
      quantity * unit_price * ( 1 - find_item_discount.percentage_discount / 100.00 )
    end
  end
end
