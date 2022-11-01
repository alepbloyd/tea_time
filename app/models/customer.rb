class Customer < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state_ab, presence: true

  has_many :customer_teas
  has_many :teas, through: :customer_teas

end
