class Contact < ApplicationRecord
  belongs_to :organization
  has_many :processes, through: :application_record
  validates :name, :presence => true, :if => "linkedin_url.blank?"
  validates :photo, :presence => true, :if => "linkedin_url.blank?"
end
