class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :upvotes
  has_many :song_submissions

  def upvoted_song?(song)
    upvotes.any? do |upvote|
      upvote.song_submission_id == song.id
    end
  end
end
