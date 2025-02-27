class AddMissingFieldsToAppointments < ActiveRecord::Migration[6.1]
    def change
      change_table :appointments do |t|
        t.datetime :appointment_date
        t.integer :status, default: 0
        t.integer :payment_status, default: 0
      end
    end
  end