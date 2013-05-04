# == Schema Information
#
# Table name: projects
#
#  id                  :integer          not null, primary key
#  project_name        :string(255)
#  project_description :string(255)
#  active              :boolean
#  client_id           :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'spec_helper'

describe Project do
  pending "add some examples to (or delete) #{__FILE__}"
end
