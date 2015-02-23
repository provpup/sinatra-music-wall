class Upvote < ActiveRecord::Base
  validates :user, uniqueness: { scope: :song_submission,
                                 message: "User can only upvote a song once" }
end