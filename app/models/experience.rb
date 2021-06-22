class Experience < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  validates :start_date, presence: true
  validates :end_date, presence: true 
end
