class AddUserColumnToSongTable < ActiveRecord::Migration
  def change
    add_reference :song_submissions, :user, index: true
  end
end