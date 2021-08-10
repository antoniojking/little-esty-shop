class Holiday
  attr_reader :localname
              :date

  def initialize(holiday)
    @localname = holiday[:localname]
    @date      = holiday[:date]
  end
end
