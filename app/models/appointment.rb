class Appointment < ApplicationRecord
  belongs_to :employee
  before_save :set_status
  before_save :validate_appointment_date_overlapping

  validates :description, :start_at, :end_at, :employee_id, presence: true

  private

  def set_status
    self.status = "approved"
  end

  def validate_appointment_date_overlapping
    employee_appointments = Appointment.where(employee_id: employee_id)
    if employee_appointments.present?
      employee_appointments.each do |appointment|
        if start_at >= appointment.start_at && start_at < appointment.end_at
          errors.add(:base, "Start Time of appointment cannot overlap")
          return false
        end
      end
    end
  end
end
