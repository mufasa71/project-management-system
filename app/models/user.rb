class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  # Setup accessible (or protected) attributes for your model
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :followed_users, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  has_many :members, :foreign_key => "user_id"
  has_many :projects, :through => :members
  belongs_to :intake
  cattr_accessor :current_user
  
  #Carrierwave uploader
  mount_uploader :profile_picture, ProfilePictureUploader

  scope :not_admins, where("admin = ?", false)

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def user_name
    name
  end

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

