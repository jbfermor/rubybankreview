module UsersHelper

  def review(user_id)
    if user_id.nil?
      "Admin"
    elsif User.find(user_id).email == current_user.email
      "Me"
    else
      current_user.email
    end
  end

    #Return CONSOLE if the transfer was through console
  #Return sender username if was between users
  def show_sender(sender)
    if sender.nil? 
      "CONSOLE" 
    else
      user = User.find(sender)
      user.email == current_user.email ? "This account" : user.email
    end
  end

  #Return THIS CCOUNT if the transfer was received
  #Return receiver if was sent
  def show_receiver(receiver)
    user = User.find(receiver)
    user.account == current_user.account ? "This account" : user.email
  end

  def amount_str(receiver, amount)
    user = User.find(receiver)
    user.email == current_user.email ? "+ " + amount.to_s : "- " + amount.to_s
  end

end
