class CreateIngredientInRecipes < ActiveRecord::Migration
  def change
    create_table :ingredient_in_recipes do |t|
      t.references :recipe # definition of foreign key
      t.references :ingredient
      t.integer :amount
      t.string :unit

      t.timestamps
    end
    add_index :ingredient_in_recipes, :recipe_id
    add_index :ingredient_in_recipes, :ingredient_id
  end
end
