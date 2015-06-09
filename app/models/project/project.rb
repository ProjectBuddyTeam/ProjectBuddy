class Project::Project < ActiveRecord::Base
  belongs_to :member, class_name: 'Identity::Member', foreign_key: 'identity_member_id'
  acts_as_taggable_on :tags

  delegate :username, to: :member, prefix: true
end
