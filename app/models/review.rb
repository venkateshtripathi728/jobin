class Review < ApplicationRecord
  belongs_to :interview
  has_many :votes
  validates :comment, presence: true,length: {minimum :6}
  validates :rating, presence: true
end
