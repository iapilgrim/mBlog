class CreateIngredientInSteps < ActiveRecord::Migration
  def change
    create_table :ingredient_in_steps do |t|
      t.references :step
      t.references :ingredient
      t.integer :amount
      t.string :unit

      t.timestamps
    end
    add_index :ingredient_in_steps, :step_id
    add_index :ingredient_in_steps, :ingredient_id
  end
end
