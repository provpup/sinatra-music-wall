class Upvote < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :song_submissions_id,
                                 message: "User can only upvote a song once" }
end