class Notification < ApplicationRecord
  scope :unread, ->{ where(status: false)}
  belongs_to :user
end
