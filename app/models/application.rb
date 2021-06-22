class Application < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :contacts, through: :application_record
  has_many :interviews
  has_many :reviews, through: :interview
  validates :job_title, presence: true
  validates :description, presence: true
  validates :status, presence: true
end
