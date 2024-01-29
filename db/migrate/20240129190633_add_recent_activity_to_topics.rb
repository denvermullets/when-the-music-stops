class AddRecentActivityToTopics < ActiveRecord::Migration[7.1]
  def change
    add_column :topics, :recent_activity, :datetime
  end
end
