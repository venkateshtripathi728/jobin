class Interview < ApplicationRecord
  belongs_to :apply
  has_one :review
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :step, presence: true
end
