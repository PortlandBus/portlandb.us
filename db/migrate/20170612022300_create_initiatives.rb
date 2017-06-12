class CreateInitiatives < ActiveRecord::Migration[5.0]
  def change
    create_table :initiatives do |t|
      t.string :name
      t.text :description
      t.belongs_to :user, foreign_key: true
      t.date :deadline
      t.boolean :active, default: false, null: false
      t.integer :time_commitment

      t.timestamps
    end
  end
end
