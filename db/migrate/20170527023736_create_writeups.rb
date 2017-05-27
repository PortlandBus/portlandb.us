class CreateWriteups < ActiveRecord::Migration[5.0]
  def change
    create_table :writeups do |t|
      t.string :url
      t.string :caption
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
