class AddFieldToCalory < ActiveRecord::Migration[6.1]
  def change
    add_column :calories, :date, :date
  end
end
