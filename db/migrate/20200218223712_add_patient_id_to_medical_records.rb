class AddPatientIdToMedicalRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :medical_records, :patient_id, :int
  end
end
