class ChangePatientBirthdateToString < ActiveRecord::Migration[6.0]
  def change
      change_column :patients, :birthdate, :string
  end
end
