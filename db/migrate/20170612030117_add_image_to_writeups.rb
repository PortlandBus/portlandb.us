class AddImageToWriteups < ActiveRecord::Migration[5.0]
  def change
    add_column :writeups, :image, :string
  end
end
