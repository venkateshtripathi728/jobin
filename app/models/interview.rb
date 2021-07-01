class Interview < ApplicationRecord
  belongs_to :apply
  has_one :review, dependent: :destroy
  has_many :notification_interviews, dependent: :destroy
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :step, presence: true
end
