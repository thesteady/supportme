module MessagesHelper
  def author_name_for(message)
    if message.customer_id
      Customer.find(message.customer_id).name
    else #user_id
      User.find(message.user_id).name
    end
  end
end
