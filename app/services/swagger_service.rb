class SwaggerService < ApiService
  def upcoming_holidays
    endpoint = 'https://date.nager.at/api/v3/NextPublicHolidays/us'
    get_data(endpoint)
  end
end
