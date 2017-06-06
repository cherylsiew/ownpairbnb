class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # validates :city, presence: true
  validates :postcode, presence: true
  # validates :state, presence: true
  validates :country, presence: true
  validates :currency, presence: true
  mount_uploaders :photos, AvatarUploader
 

end