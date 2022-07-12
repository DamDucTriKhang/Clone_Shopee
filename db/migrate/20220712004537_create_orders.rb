class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :contact, foreign_key: true, null: false
      t.references :logistic, foreign_key: true, null: false
      t.references :voucher, foreign_key: true, null: false
      t.integer :total_price
      t.integer :status
      
      t.timestamps
    end
  end
end
