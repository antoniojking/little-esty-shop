class BulkDiscount < ApplicationRecord
  belongs_to :merchant

  validates :percentage_discount, presence: true
  validates :percentage_discount, numericality: { only_integer: true }
  validates :percentage_discount, length: { maximum: 99 }

  validates :quantity_threshold, presence: true
  validates :quantity_threshold, numericality: { only_integer: true }
end
