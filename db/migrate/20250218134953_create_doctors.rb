class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.string :specialty, null: false
      t.string :address
      t.date :joining_date, null: false
      t.string :mobile_no, null: false, unique: true
      t.integer :years_of_experience, null: false
      t.boolean :availability, default: true

      t.timestamps
    end
  end
end
