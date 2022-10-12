module DeviseRequestSpecHelper
  include Warden::Test::Helpers

  def sign_in(user)
    login_as(user, scope: :user)
  end

  def sign_out(user)
    logout(user)
  end
end