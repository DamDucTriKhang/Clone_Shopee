class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.references :product, foreign_key: true, null: false
      t.integer :price
      t.integer :quantity
      t.integer :itemable_id
      t.string :itemable_type

      t.timestamps
    end
  end
end
