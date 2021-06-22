class Interview < ApplicationRecord
  belongs_to :application
  has_one :review
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :step, presence: true
  validates :notes, presence: true
end
