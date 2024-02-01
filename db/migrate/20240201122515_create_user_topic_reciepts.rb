class CreateUserTopicReciepts < ActiveRecord::Migration[7.1]
  def change
    create_table :user_topic_receipts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.datetime :last_read

      t.timestamps
    end
  end
end
