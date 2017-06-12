class CreateBccAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :bcc_addresses do |t|
      t.belongs_to :email, foreign_key: true
      t.belongs_to :email_address, foreign_key: true

      t.timestamps
    end
  end
end
