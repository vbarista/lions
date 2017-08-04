class Event < ApplicationRecord
  has_many :confirmations, dependent: :destroy
  has_many :mail_destinations, dependent: :destroy
  has_many :groups, through: :mail_destinations
  belongs_to :user

  validates :title, presence: true
end
