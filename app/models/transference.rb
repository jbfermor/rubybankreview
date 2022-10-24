class Transference < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true
  validates :receiver, presence: true
  validates :final_balance, presence: true
  validates :account, presence: true
  validates_associated :account


  private

  def self.console_create_transference(amount, receiver) 
    receiver_email = User.find_by(email: receiver)
    account = receiver_email.account
    Transference.create!(amount: amount, receiver: receiver, final_balance: account.balance + amount, account: account )
  end

end
