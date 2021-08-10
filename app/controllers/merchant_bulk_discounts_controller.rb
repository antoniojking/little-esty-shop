class MerchantBulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show

  end

  private
  
  def api_holidays
    json = SwaggerService.new.upcoming_holidays
    json.map do |holiday|
      Holiday.new(holiday)
    end
  end
end
