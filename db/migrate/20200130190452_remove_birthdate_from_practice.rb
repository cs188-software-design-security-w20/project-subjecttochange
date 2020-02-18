class RemoveBirthdateFromPractice < ActiveRecord::Migration[6.0]
  def change
    remove_column :practices, :birthdate
  end
end
