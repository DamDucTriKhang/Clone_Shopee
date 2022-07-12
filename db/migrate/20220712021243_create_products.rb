class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :shop, foreign_key: true, null: false
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
