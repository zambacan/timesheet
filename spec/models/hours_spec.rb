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
#

require 'spec_helper'

describe Hours do
  pending "add some examples to (or delete) #{__FILE__}"
end
