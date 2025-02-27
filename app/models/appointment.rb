class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  enum status: { scheduled: 0, completed: 1, canceled: 2 }, _default: :scheduled, _prefix: true
  enum payment_status: { pending: 0, paid: 1 }, _default: :pending, _prefix: true

  before_validation :validate_appointment_date
  before_update :update_status_if_past
  before_update :check_cancellation

  private
  def validate_appointment_date
    if new_record? && appointment_date.present? && appointment_date < Time.current
      errors.add(:appointment_date, "cannot be in the past")
      throw(:abort)
    end
  end
  

  def update_status_if_past
    if appointment_date.present? && appointment_date < Time.current && status == "scheduled"
      self.status = "completed"
    end
  end
  

  def check_cancellation
    if will_save_change_to_status? && status == "canceled" && appointment_date.present? && appointment_date < Time.current
      errors.add(:base, "Cannot cancel past appointments")
      throw(:abort)
    end
  end
end  
