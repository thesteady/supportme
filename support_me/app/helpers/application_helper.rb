module ApplicationHelper
  def formatted_time(input)
    input.localtime.strftime("%B %d, %Y - %l:%M %p")
  end
end