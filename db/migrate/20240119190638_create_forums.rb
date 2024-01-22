class CreateForums < ActiveRecord::Migration[7.1]
  def change
    create_table :forums do |t|
      t.string :name
      t.string :access

      t.timestamps
    end
  end
end
