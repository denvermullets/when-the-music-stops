class UserTopicReceipt < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  def update_last_read
    update(last_read: Time.current)
  end
end
