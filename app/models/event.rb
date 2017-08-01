class Event < ApplicationRecord
  has_many :confirmations, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
end
