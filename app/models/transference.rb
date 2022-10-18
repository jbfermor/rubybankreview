class Transference < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true
  validates :receiver, presence: true
  validates :account, presence: true
  validates_associated :account

  private

  def self.console_create_transference(amount, receiver)
    
    receiver_email = User.find_by(email: receiver)
    account = Account.find_by(user: receiver_email)
    Transference.create!(amount: amount, receiver: receiver, account: account )
    
  end

end
