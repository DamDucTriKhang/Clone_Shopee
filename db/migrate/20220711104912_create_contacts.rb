class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :contact_name
      t.string :phone
      t.string :address
      t.integer :contact_type

      t.timestamps
    end
  end
end
