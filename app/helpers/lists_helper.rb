module ListsHelper
  def time_remaining(date)
    distance_of_time_in_words(date, DateTime.now)
  end
end
