class CreateSongSubmissionTable < ActiveRecord::Migration
  def change
    create_table :song_submissions do |table|
      table.string :title
      table.string :author
      table.string :url
      table.timestamps
    end
  end
end
