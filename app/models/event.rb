class Event < ApplicationRecord
  has_many :confirmations, dependent: :destroy

  validates :title, presence: true
end
