class AddBirthdateToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :birthdate, :datetime
  end
end
