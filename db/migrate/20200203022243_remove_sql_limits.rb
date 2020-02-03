class RemoveSqlLimits < ActiveRecord::Migration[6.0]
  def change
    change_column :patients, :middle_initial, :string, :limit => nil
    change_column :patients, :gender, :string, :limit => nil
    change_column :patients, :state, :string, :limit => nil
    change_column :patients, :zipcode, :string, :limit => nil

    change_column :practices, :middle_initial, :string, :limit => nil
    change_column :practices, :state, :string, :limit => nil
    change_column :practices, :zipcode, :string, :limit => nil
  end
end
