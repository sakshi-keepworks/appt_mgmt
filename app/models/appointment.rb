class Appointment < ApplicationRecord
  belongs_to :employee
  before_save :set_status
  before_save :validate_appointment_date_overlapping

  validates :description, :start_date, :end_date, :employee_id, presence: true
  scope :employee_appointments, ->(employee_id){ where(employee_id: employee_id) }

  private

  def set_status
    self.status = "approved"
  end

  def validate_appointment_date_overlapping
    if employee_appointments.present?
      employee_appointments.each do |appointment|
        if appointment.start_date >= start_date && appointment.end_date < start_date
          errors.add(:base, "Start Time of appointment cannot overlap")
        end
      end
    end
  end
end
