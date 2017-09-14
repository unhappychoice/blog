TIME_ZONE = 'Asia/Tokyo'.freeze

class String
  def prev_month?
    to_time > Time.now.in_time_zone(TIME_ZONE).beginning_of_month.prev_month &&
        to_time < Time.now.in_time_zone(TIME_ZONE).beginning_of_month
  end

  def to_time
    Time.iso8601(self).in_time_zone(TIME_ZONE)
  end

  def to_time_string
    to_time.strftime('%m/%d')
  end
end
