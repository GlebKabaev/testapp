class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments
  
  has_many :subscriptions, foreign_key: :subscriber_id
  has_many :subscribed_to, through: :subscriptions, source: :subscribed_to

  # Пользователи, которые подписаны на текущего пользователя
  has_many :reverse_subscriptions, foreign_key: :subscribed_to_id, class_name: 'Subscription'
  has_many :subscribers, through: :reverse_subscriptions, source: :subscriber
end
