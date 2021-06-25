class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :contact_applies
  has_many :contacts, through: :contact_applies, dependent: :destroy
  has_many :interviews
  has_many :reviews, through: :interview
  validates :job_title, presence: true
  validates :status, presence: true, inclusion: { in: %w(Ready\ to\ apply Applied Ongoing\ process Waiting\ for\ answer),
    message: "%{value} is not a valid" }
end
