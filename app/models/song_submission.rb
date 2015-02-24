class SongSubmission < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true

  has_many :upvotes
  belongs_to :user
end
