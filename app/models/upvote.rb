class Upvote < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :song_submission_id,
                                    message: "User can only upvote a song once" }
end