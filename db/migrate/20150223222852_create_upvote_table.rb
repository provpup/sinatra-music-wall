class CreateUpvoteTable < ActiveRecord::Migration
  def change
    create_table :upvotes do |table|
      table.references :user
      table.references :song_submission
      table.timestamps
    end
  end
end
