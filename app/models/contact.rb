class Contact < ApplicationRecord
  belongs_to :organization
  has_many :contact_applications
  has_many :applications, through: :contact_applications, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true, unless: :linkedin_url
end
