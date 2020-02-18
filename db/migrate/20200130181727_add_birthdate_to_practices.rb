class AddBirthdateToPractices < ActiveRecord::Migration[6.0]
  def change
    add_column :practices, :birthdate, :datetime
  end
end
