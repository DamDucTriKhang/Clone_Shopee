class CreateVouchers < ActiveRecord::Migration[6.1]
  def change
    create_table :vouchers do |t|
      t.references :shop, foreign_key: true, null: false
      t.string :name
      t.text :description
      t.integer :discount_amount
      t.integer :discount_type

      t.timestamps
    end
  end
end
