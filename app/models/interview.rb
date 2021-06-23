class Interview < ApplicationRecord
  belongs_to :apply
  has_one :review
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :step, presence: true
end
