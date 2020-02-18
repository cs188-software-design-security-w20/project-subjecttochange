class CreateMedicalRecords2 < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_records do |t|
      t.string :patient_email
      t.string :practice_email

      t.timestamps
    end
  end
end
