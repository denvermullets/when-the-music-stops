class CreateTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.references :forum, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :sub_forum, null: false, foreign_key: true
      t.boolean :is_locked, default: :false

      t.timestamps
    end
  end
end
