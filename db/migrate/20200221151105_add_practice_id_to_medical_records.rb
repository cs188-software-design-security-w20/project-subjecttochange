class AddPracticeIdToMedicalRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :medical_records, :practice_id, :int
  end
end
