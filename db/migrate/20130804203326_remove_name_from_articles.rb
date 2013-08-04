class RemoveNameFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :name
  end

  def down
    add_column :articles, :name, :string
  end
end
