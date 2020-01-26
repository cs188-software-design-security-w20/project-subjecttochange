class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :patient_email
      t.string :practice_email
      t.datetime :appt_start
      t.integer :duration
      t.string :description

      t.timestamps
    end
  end
end
