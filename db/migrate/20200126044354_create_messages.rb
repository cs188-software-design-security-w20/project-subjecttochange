class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :to_email
      t.string :from_email
      t.string :message_title
      t.string :message_body

      t.timestamps
    end
  end
end
