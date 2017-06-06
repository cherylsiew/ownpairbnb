class User < ApplicationRecord
  include Clearance::User

 validates :password, length: { minimum: 6 }, on: :create
 has_many :listings, :dependent => :destroy
 has_many :bookings, :dependent => :destroy

 #In app/models/user.rb    
 has_many :authentications, :dependent => :destroy
 enum roles: [:customer, :moderator, :superadmin]
 mount_uploader :avatar, AvatarUploader

  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(first_name: auth_hash["name"], email: auth_hash["extra"]["raw_info"]["email"],password: SecureRandom.hex(5))
      user.authentications << (authentication)     
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

end
