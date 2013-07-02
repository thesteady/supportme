module ApplicationHelper
  def formatted_time(input)
    input.strftime("%B %d, %Y - %l:%M %p")
  end

  # def get_author_name_for(message)
  #   return User.find_by_id(message.author_id).name if message.author_type == "User"
  #   return Customer.find_by_id(message.author_id).name if message.author_type == "Customer"
  # end
end
