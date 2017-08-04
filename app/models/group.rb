# 委員会
class Group < ApplicationRecord
  has_many :affiliations, dependent: :destroy
  has_many :users, through: :affiliations
  
  has_many :mail_destinations, dependent: :destroy
  has_many :events, through: :mail_destinations

  accepts_nested_attributes_for :affiliations, allow_destroy: true

  enum type: {
    'Groups::Operation' => '運営委員会',
    'Groups::Executive' => '実行委員会',
    'Groups::Special'   => '特別委員会',
  }
end
