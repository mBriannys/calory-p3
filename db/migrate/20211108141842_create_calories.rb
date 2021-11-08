class CreateCalories < ActiveRecord::Migration[6.1]
  def change
    create_table :calories do |t|
      t.integer :ingested_calories
      t.text :comment_ingested
      t.integer :burned_calories
      t.text :comment_burned
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
