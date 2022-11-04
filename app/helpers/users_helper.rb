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

end
