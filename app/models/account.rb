class Account < ApplicationRecord
  belongs_to :user

  validates :balance, presence: true
  validates :user_id, presence: true
  validates_associated :user
  
end
