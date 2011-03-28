class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :tweet_id
      t.text :text
      t.string :to_user
      t.integer :to_user_id
      t.string :from_user
      t.integer :from_user_id
      t.string :iso_language_code
      t.datetime :tweet_created_at
      t.string :profile_image_url
      t.integer :recent_retweets
      t.string :hast_tag
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
