class RemoveNameArticle < ActiveRecord::Migration
  def up
  	remove_column :articles, :name
  end

  def down
  end
end
