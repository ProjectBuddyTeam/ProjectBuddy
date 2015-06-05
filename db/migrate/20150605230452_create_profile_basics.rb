class CreateProfileBasics < ActiveRecord::Migration
  def change
    create_table :profile_basics do |t|
      t.references :identity_member, index: true, foreign_key: true
      t.string :first_name, default: ''
      t.string :last_name, default: ''
      t.string :github, default: ''
      t.string :deviantart, default: ''

      t.timestamps null: false
    end
  end
end
