class Organization < ApplicationRecord
  has_many :applies
  has_many :experiences
  has_many :contacts
  has_one_attached :photo
  validates :name, presence: true
end
