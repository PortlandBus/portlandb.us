class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :text
      t.datetime :last_tweeted
      t.integer :tweet_counter
      t.boolean :active, default: false, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
