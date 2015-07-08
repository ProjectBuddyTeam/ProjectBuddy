class Project::Question < ActiveRecord::Base
  belongs_to :member, class_name: 'Identity::Member', foreign_key: 'identity_member_id'
  belongs_to :project, class_name: 'Project::Project', foreign_key: 'project_project_id'

  delegate :username, to: :member, prefix: :asker
  delegate :codename, :member, to: :project, prefix: true
end
