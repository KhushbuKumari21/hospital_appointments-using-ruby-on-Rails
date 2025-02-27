class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.datetime :appointment_date, null: false
      t.integer :status, default: 0, null: false
      t.integer :payment_status, default: 0, null: false
      
      t.timestamps
    end
  end
end