class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
