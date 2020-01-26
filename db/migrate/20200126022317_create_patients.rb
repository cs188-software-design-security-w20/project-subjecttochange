class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :middle_initial, limit: 1
      t.string :gender, limit: 1
      t.integer :phone_number
      t.string :street_address
      t.string :city
      t.string :state, limit: 2
      t.integer :zipcode, limit: 5

      t.timestamps
    end
  end
end
