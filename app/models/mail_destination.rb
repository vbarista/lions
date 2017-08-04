class MailDestination < ApplicationRecord
  belongs_to :event
  belongs_to :group
end
