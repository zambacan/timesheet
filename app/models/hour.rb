# == Schema Information
#
# Table name: hours
#
#  id                     :integer          not null, primary key
#  project_id             :integer
#  performed_on           :date
#  start_time             :time
#  finish_time            :time
#  billable_unit_quantity :decimal(, )
#  activity_type          :string(255)
#  billing_status         :string(255)      default("unbilled")
#  user_id                :integer
#  billing_rate           :decimal(, )
#  billing_unit           :string(255)      default("hours")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  description            :string(255)
#

class Hour < ActiveRecord::Base
  attr_accessible :activity_type, :description, :billable_unit_quantity, :billing_rate, :billing_status, :billing_unit, :finish_time, :performed_on, :project_name, :start_time, :user_id
 belongs_to :project
# activity_types include: consulting, meetings, coding, testing, business development
# billing_status include: unbilled, billed, non-billable
# billing_unit includes: hours, days, fixed-price
validates :description, presence: true 
validates :project_name, presence: true 
def project_name
  project.try(:project_name)
end


def project_name=(project_name)
  self.project=Project.find_by_project_name(project_name) if project_name.present?
end

end
