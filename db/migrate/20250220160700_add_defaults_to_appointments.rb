
class AddDefaultsToAppointments < ActiveRecord::Migration[6.0]
  def change
    change_column_default :appointments, :status, 0
    change_column_default :appointments, :payment_status, 0
  end
end
