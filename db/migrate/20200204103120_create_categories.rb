class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.integer :category_status, default: 0

      t.timestamps
    end
  end
end
