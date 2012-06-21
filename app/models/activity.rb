class Activity < ActiveRecord::Base
  belongs_to :phase
  belongs_to :status, :class_name => 'ActivityStatus', :foreign_key => 'status_id'
  belongs_to :assignee, :class_name => 'Member', :foreign_key => 'member_id'
  has_many :attachments, :as => :attachable
  has_one :event, :as => :eventable, :dependent => :destroy
  has_one :document, :as => :documentable, :dependent => :destroy
  has_many :attachments, :dependent => :destroy, :as => :attachable
  accepts_nested_attributes_for :event
  accepts_nested_attributes_for :attachments
  validates_presence_of :title, :status, :assignee

  after_create :create_document
  after_create :set_document

  def set_document
    self.document.project = self.phase.project
    self.document.pad_id = SecureRandom.hex
    self.document.save!
  end

  def self.delayed_activities
    UserMailer.try_mail(1).deliver
  end
end
# == Schema Information
#
# Table name: activities
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  phase_id    :integer
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  status_id   :integer
#  priority_id :integer
#  file        :string(255)
#  member_id   :integer
#  done        :boolean         default(FALSE)
#

