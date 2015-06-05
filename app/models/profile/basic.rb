class Profile::Basic < ActiveRecord::Base
  belongs_to :member, class_name: 'Identity::Member', foreign_key: 'identity_member_id'
end
