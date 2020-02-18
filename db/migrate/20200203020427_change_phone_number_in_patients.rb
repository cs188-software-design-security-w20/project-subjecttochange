class ChangePhoneNumberInPatients < ActiveRecord::Migration[6.0]
  def change
      change_column :patients, :phone_number, :string
      change_column :practices, :phone_number, :string
  end
end
