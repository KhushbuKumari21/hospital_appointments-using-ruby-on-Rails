# lib/tasks/appointments.rake
namespace :appointments do
    desc "Update past appointments to completed"
    task update_appointments: :environment do
      Appointment.where("appointment_date < ? AND status = ?", Time.now, :scheduled).update_all(status: :completed)
      puts "Past appointments updated to completed."
    end
  end
  