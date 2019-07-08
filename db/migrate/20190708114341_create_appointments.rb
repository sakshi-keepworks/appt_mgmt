class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.text :descrption
      t.datetime :start_at
      t.datetime :end_at
      t.integer :employee_id

      t.timestamps
    end
  end
end
