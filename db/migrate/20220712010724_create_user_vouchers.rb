class CreateUserVouchers < ActiveRecord::Migration[6.1]
  def change
    create_table :user_vouchers do |t|
      t.references :user, foreign_key: true, null: false
      t.references :voucher, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
