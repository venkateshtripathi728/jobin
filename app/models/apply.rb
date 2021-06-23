class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :contact_applies
  has_many :contacts, through: :contact_applies, dependent: :destroy
  has_many :interviews
  has_many :reviews, through: :interview
  validates :job_title, presence: true
  validates :description, presence: true
  validates :status, presence: true
end