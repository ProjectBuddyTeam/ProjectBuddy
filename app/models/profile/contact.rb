class Profile::Contact

  attr_accessor :username, :email, :github, :deviantart, :member_id

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def self.find_by_member_id(id)
    @member_id = id
    member = Identity::Member.find_by_id(id)
    profile = member.profile_basic
    new(
        member_id: id,
        username: member.username,
        email: member.email,
        github: (profile.github.blank? ? 'None' : profile.github),
        deviantart: (profile.deviantart.blank? ? 'None' : profile.deviantart)
    )
  end
end