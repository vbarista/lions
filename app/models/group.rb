# 委員会
class Group < ApplicationRecord
  has_many :affiliations
  has_many :users, through: :affiliations

  accepts_nested_attributes_for :affiliations, allow_destroy: false

  enum type: {
    'Groups::Operation' => '運営委員会',
    'Groups::Executive' => '実行委員会',
    'Groups::Special'   => '特別委員会',
  }
end
