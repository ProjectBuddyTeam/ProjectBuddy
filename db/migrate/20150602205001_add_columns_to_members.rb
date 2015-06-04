class AddColumnsToMembers < ActiveRecord::Migration
  def change
    add_column :identity_members, :provider, :string
    add_column :identity_members, :uid, :string
  end
end
