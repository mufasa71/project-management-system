class User < ActiveRecord::Base
  acts_as_messageable
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :intake
  cattr_accessor :current_user
  
  #Carrierwave uploader
  mount_uploader :profile_picture, ProfilePictureUploader

  scope :not_admins, where("admin = ?", false)

  def to_s
    name
  end

  def mailboxer_email(object)
    return email
  end

  def self.search(search)
    if search
      where('number LIKE ? or name LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  admin                  :boolean         default(FALSE)
#  name                   :string(255)
#  number                 :string(255)
#  skype                  :string(255)
#  msn                    :string(255)
#  twitter                :string(255)
#  facebook               :string(255)
#  intake_id              :integer
#  profile_picture        :string(255)
#

