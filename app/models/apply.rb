class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :contact_applies
  has_many :contacts, through: :contact_applies, dependent: :destroy
  has_many :interviews, dependent: :destroy
  has_many :reviews, through: :interview
  has_many :notification_applies, dependent: :destroy
  has_many :notification_interviews, through: :interview
  validates :job_title, presence: true
  validates :status, presence: true, inclusion: { in: %w(Ready\ to\ apply Applied Ongoing\ process Waiting\ for\ answer),
    message: "%{value} is not a valid" }
  validates :finalstatus, inclusion: { in: %w(Pending Accepted Declined) }
end
