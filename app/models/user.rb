class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :applies, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :votes
  has_many :notification_applies, through: :applies
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one_attached :photo
end
