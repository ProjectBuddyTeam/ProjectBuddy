json.array!(@profile_basics) do |profile_basic|
  json.extract! profile_basic, :id, :identity_member_id, :first_name, :last_name, :github, :deviantart
  json.url profile_basic_url(profile_basic, format: :json)
end
