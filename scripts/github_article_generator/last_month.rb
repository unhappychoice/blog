TIME_ZONE = 'Asia/Tokyo'.freeze

module LastMonth
  module_function

  def cover?(time)
    range.cover?(time.in_time_zone(TIME_ZONE))
  end

  def format(time)
    time.in_time_zone(TIME_ZONE).strftime('%m/%d')
  end

  def range
    this_month = Time.now.in_time_zone(TIME_ZONE).beginning_of_month
    this_month.prev_month...this_month
  end
end
