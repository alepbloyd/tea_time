class SubscriptionTea < ApplicationRecord

  validates :subscription_id, presence: true
  validates :tea_id, presence: true

  belongs_to :subscription
  belongs_to :tea
  
end