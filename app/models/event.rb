class Event < ApplicationRecord
  has_many :confirmations, dependent: :destroy
  has_many :mail_destinations, dependent: :destroy
  has_many :groups, through: :mail_destinations
  belongs_to :user
  
  accepts_nested_attributes_for :mail_destinations, allow_destroy: true

  validates :title, presence: true
end
