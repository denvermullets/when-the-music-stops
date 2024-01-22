class CreateSubForums < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_forums do |t|
      t.string :name
      t.references :forum, null: false, foreign_key: true
      t.string :access

      t.timestamps
    end
  end
end
