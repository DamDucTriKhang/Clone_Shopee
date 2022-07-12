class CreateLogistics < ActiveRecord::Migration[6.1]
  def change
    create_table :logistics do |t|
      t.string :name
      t.string :phone
      t.integer :transport_fee

      t.timestamps
    end
  end
end
