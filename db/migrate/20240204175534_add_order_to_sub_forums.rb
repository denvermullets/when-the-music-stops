class AddOrderToSubForums < ActiveRecord::Migration[7.1]
  def change
    add_column :sub_forums, :forum_order, :integer, default: 0
  end
end
