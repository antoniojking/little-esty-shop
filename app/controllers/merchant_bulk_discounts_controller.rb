class MerchantBulkDiscountsController < ApplicationController
  def index
    @bulk_discounts = BulkDiscount.all
  end
end
