class Review < ApplicationRecord
  belongs_to :interview
  validates :comment, presence: true,length: {minimum: 6}
  validates :rating, presence: true
end
