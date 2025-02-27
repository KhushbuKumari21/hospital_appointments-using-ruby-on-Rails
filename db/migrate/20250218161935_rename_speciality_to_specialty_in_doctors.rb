class RenameSpecialityToSpecialtyInDoctors < ActiveRecord::Migration[6.0]
  def change
    if column_exists?(:doctors, :speciality)
      rename_column :doctors, :speciality, :specialty
    else
      # If you want, log a message or skip this operation
      puts "Column 'speciality' does not exist in the doctors table."
    end
  end
end
