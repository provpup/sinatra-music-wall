class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :upvotes

  def upvoted_song?(song)
    upvotes.any? do |upvote|
      upvote.song_submissions_id == song.id
    end
  end
end
