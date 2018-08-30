namespace :hosts do
  task check_hosts: :environment do
    UrlCheck.check_hosts
  end
end