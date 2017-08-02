# 委員会
class Group < ApplicationRecord
  enum type: {
    'Groups::Operation' => '運営委員会',
    'Groups::Executive' => '実行委員会',
    'Groups::Special'   => '特別委員会',
  }
end
