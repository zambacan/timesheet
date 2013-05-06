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

class Project < ActiveRecord::Base
  attr_accessible :active, :client_id, :project_description, :project_name, :client_name
  belongs_to :client
  
  def client_name
    client.try(:name)
    end
  
  def client_name=(name)
    self.client=Client.find_by_name(name) if name.present?
    
  end
end
