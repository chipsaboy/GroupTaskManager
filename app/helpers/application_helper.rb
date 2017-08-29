module ApplicationHelper
  def display_date(date)
    return date.strftime("%A %B %e %Y at %l:%m%p")
  end
end
