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
    sender == nil ? "CONSOLE" : User.find_by(account: Account.find(sender)).username
  end

  #Return THIS CCOUNT if the transfer was received
  #Return receiver if was sent
  def show_receiver(receiver)
    Account.find(receiver) == current_user.account ? "This account" : User.find_by(account: Account.find(receiver)).username
  end

end
