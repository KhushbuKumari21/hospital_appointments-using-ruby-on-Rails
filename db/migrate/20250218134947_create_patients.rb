class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :address
      t.integer :age, null: false
      t.string :phone_number, null: false, unique: true

      t.timestamps
    end
  end
end
