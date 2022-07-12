class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.references :product, foreign_key: true, null: false
      t.string :quatity

      t.timestamps
    end
  end
end
