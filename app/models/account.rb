class Account < ApplicationRecord
  belongs_to :user
  has_many :transferences

  validates :balance, presence: true
  validates :user_id, presence: true
  
end
