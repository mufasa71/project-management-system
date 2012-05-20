class TimeEntry < ActiveRecord::Base
  belongs_to :project
  belongs_to :issue
  belongs_to :user
  belongs_to :activity, :class_name => 'TimeEntryActivity', :foreign_key => 'activity_id'

  validates_presence_of :user_id, :activity_id, :project_id, :hours, :spent_on
  validates_numericality_of :hours, :allow_nil => true, :message => :invalid
  validates_length_of :comments, :maximum => 255, :allow_nil => true

  attr_accessor :tyear, :tmonth, :tweek

  def hours
    h = read_attribute(:hours)
    if h.is_a?(Float)
      h.round(2)
    else
      h
    end
  end

  def spent_on=(date)
    super
    if spent_on.is_a?(Time)
      self.spent_on = spent_on.to_date
    end
    #self.tyear = spent_on ? spent_on.year : nil
    #self.tmonth = spent_on ? spent_on.month : nil
    #self.tweek = spent_on ? Date.civil(spent_on.year, spent_on.month, spent_on.day).cweek : nil
  end
end
# == Schema Information
#
# Table name: time_entries
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  activity_id :integer
#  project_id  :integer
#  hours       :integer
#  spent_on    :integer
#  comments    :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  issue_id    :integer
#

