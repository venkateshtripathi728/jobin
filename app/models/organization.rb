class Organization < ApplicationRecord
  has_many :applies
  has_many :experiences
  has_many :contacts
  validates :name, presence: true
end
