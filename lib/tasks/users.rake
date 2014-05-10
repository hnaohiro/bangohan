namespace :users do
  desc "reset user's schedule"
  task :reset => :environment do
    User.reset
  end
end
