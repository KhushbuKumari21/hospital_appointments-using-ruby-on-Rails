class ChangeStatusAndPaymentStatusToInteger < ActiveRecord::Migration[6.1]
  def up
    # Convert string statuses to integers
    execute <<-SQL
      UPDATE appointments SET status = 
        CASE status
          WHEN 'scheduled' THEN 0
          WHEN 'completed' THEN 1
          WHEN 'cancelled' THEN 2
        END;
    SQL

    execute <<-SQL
      UPDATE appointments SET payment_status = 
        CASE payment_status
          WHEN 'pending' THEN 0
          WHEN 'paid' THEN 1
        END;
    SQL

    # Change columns to integer type
    change_column :appointments, :status, 'integer USING CAST(status AS integer)'
    change_column :appointments, :payment_status, 'integer USING CAST(payment_status AS integer)'
  end

  def down
    # Revert integers back to strings if needed
    change_column :appointments, :status, :string
    change_column :appointments, :payment_status, :string

    execute <<-SQL
      UPDATE appointments SET status = 
        CASE status
          WHEN 0 THEN 'scheduled'
          WHEN 1 THEN 'completed'
          WHEN 2 THEN 'cancelled'
        END;
    SQL

    execute <<-SQL
      UPDATE appointments SET payment_status = 
        CASE payment_status
          WHEN 0 THEN 'pending'
          WHEN 1 THEN 'paid'
        END;
    SQL
  end
end
