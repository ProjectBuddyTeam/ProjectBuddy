json.array!(@project_projects) do |project_project|
  json.extract! project_project, :id, :codename, :mission, :member_id
  json.url project_url(project_project, format: :json)
end
