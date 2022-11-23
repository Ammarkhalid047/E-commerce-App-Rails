set :environment, "development"
set :output, "log/cron.log"

every :day, at: ["12:00 AM"] do
    rake 'seller:check_subscriptions'
  end

