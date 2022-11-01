class Tea < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :temperature, presence: true
  validates :brew_time, presence: true

  has_many :customer_teas
  has_many :customers, through: :customer_teas
  
end
