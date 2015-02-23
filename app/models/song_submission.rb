class SongSubmission < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true

  has_many :upvotes
end
