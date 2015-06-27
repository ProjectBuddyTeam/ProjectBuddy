namespace :project_buddy do
  desc 'Filling in missing slugs in projects'
  task fill_in_missing_slugs: :environment do
    Project::Project.where(slug: nil).each do |proj|
      proj.slug = nil
      proj.save
    end
  end
end
