class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :subject
      t.date :date
      t.string :message_id
      t.text :decoded
      t.text :text_body
      t.text :html_body
      t.text :raw

      t.timestamps
    end
  end
end
