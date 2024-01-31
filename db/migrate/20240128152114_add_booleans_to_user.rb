class AddBooleansToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :display_post_count, :boolean, default: true
    add_column :users, :display_location, :boolean, default: true
    add_column :users, :location, :string
    add_column :users, :post_count, :integer, default: 0
  end
end
