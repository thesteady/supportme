module ApplicationHelper
  def formatted_time(input)
    input.strftime("%B %d, %Y - %l:%M %p")
  end
end