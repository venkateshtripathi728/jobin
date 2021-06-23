class Contact < ApplicationRecord
  belongs_to :organization
  has_many :contact_applies
  has_many :applies, through: :contact_applies, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true, unless: :linkedin_url
end
