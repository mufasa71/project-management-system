class Project < ActiveRecord::Base
  validates_presence_of :name, :identifier, :intake, :subject, :supervisor
  validates_uniqueness_of :identifier
  validates_length_of :name, :maximum => 255
  validates_length_of :homepage, :maximum => 255
  validates_length_of :identifier, :maximum => 255
  validates_exclusion_of :identifier, :in => %w(new)

  has_many :members, :include => [:user], :dependent => :destroy
  has_many :milestones, :dependent => :destroy
  has_many :documents, :dependent => :destroy
  has_many :phases, :dependent => :destroy, :order => "position"
  has_many :activities, :through => :phases
  has_many :milestones, :dependent => :destroy
  has_many :attachments
  has_many :reports, :dependent => :destroy
  has_one :event, :as => :eventable, :dependent => :destroy
  has_one :group, :dependent => :destroy
  belongs_to :intake
  belongs_to :subject
  belongs_to :supervisor
  accepts_nested_attributes_for :event

  def to_s
    name
  end

  def complete
    unless phases.empty? && phases_complete.empty?
      ((phases_complete.size.to_f / phases.size.to_f) * 100).to_i.to_s << "%"
    else
      0.to_s << "%"
    end
  end

  def phases_complete
    phases.where(:complete => true)
  end
end
# == Schema Information
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  identifier  :string(255)
#  homepage    :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  description :text
#  is_public   :boolean         default(TRUE)
#

