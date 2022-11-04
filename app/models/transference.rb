class Transference < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true
  validates :receiver, presence: true
  validates :final_balance, presence: true
  validates :account, presence: true
  validates_associated :account


  private

  def self.console_create_transference(amount, receiver_email)
    puts receiver_email
    receiver = User.find_by(email: receiver_email)
    account = receiver.account
    Transference.create( amount: amount, sender: nil, receiver: receiver.id, final_balance: account.balance + amount, account: account ) unless receiver.nil?
  end

end
