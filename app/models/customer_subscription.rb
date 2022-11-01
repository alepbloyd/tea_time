class CustomerSubscription < ApplicationRecord

  validates :customer_id, presence: true
  validates :subscription_id, presence: true
  validates :status, presence: true

  belongs_to :customer
  belongs_to :subscription

end