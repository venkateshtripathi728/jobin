class Organization < ApplicationRecord
  has_many :applies
  has_many :experiences
  has_many :contacts
  accepts_nested_attributes_for :applies
  validates :name, presence: true
end
