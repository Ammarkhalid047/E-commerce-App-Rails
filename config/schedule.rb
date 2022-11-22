set :environment, "development"
set :output, "log/cron.log"

every :day, at: ["12:00 AM"] do
    rake rake 'check_subscriptions:customer'
  end

