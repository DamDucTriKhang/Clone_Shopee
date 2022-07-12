class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :stock, foreign_key: true, null: false

      t.string :quatity
      t.datetime :date

      t.timestamps
    end
  end
end
