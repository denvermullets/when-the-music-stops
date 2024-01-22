class AddSlugToForumsAndSubForumsAndTopics < ActiveRecord::Migration[7.1]
  def change
    add_column :forums, :slug, :string
    add_column :sub_forums, :slug, :string
    add_column :topics, :slug, :string

    add_index :forums, :slug, unique: true
    add_index :sub_forums, :slug, unique: true
    add_index :topics, :slug, unique: true
  end
end
