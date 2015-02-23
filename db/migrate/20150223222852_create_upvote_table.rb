class CreateUpvoteTable < ActiveRecord::Migration
  def change
    create_table :upvote do |table|
      table.references :user
      table.references :song_submissions
      table.timestamps
    end
  end
end
