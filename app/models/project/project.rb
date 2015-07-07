class Project::Project < ActiveRecord::Base
  include FriendlyId

  belongs_to :member, class_name: 'Identity::Member', foreign_key: 'identity_member_id'
  acts_as_taggable_on :tags
  has_many :questions, class_name: 'Project::Question', foreign_key: 'project_project_id'

  delegate :username, :created_at, :id, to: :member, prefix: true

  enum status: {
           active: 0,
           archived: 1
       }

  is_impressionable
  friendly_id :codename, use: [:slugged]

  def slug_candidates
    [
        :codename,
        [:codename, :member_username]
    ]
  end
end
