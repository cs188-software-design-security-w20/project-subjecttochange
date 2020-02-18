class AddTitleToMedicalRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :medical_records, :title, :string
  end
end
