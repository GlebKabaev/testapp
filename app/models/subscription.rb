class Subscription < ApplicationRecord
  belongs_to :subscriber, class_name: 'User'
  belongs_to :subscribed_to, class_name: 'User'

  validates :subscriber_id, presence: true
  validates :subscribed_to_id, presence: true
end
