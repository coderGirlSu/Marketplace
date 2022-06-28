class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.boolean :sold, default: false
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.string :colour
      t.integer :condition
      t.date :listed_date

      t.timestamps
    end
  end
end
