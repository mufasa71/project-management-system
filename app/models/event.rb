class Event < ActiveRecord::Base

  has_event_calendar
  belongs_to :eventable, :polymorphic => true

  def attachable_type=(sType)
    super(sType.to_s.classify.constantize.base_class.to_s)
  end

  def to_s
    name
  end

end
# == Schema Information
#
# Table name: events
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  start_at       :date
#  end_at         :date
#  all_day        :boolean         default(FALSE)
#  eventable_id   :integer
#  eventable_type :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

