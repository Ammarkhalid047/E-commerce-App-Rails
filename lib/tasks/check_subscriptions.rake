namespace :seller do
  desc "Check if seller subscription has expired or not"
  task check_subscriptions: :environment do
    @subscriptions = Subscription.all
    @subscriptions.each do |subscription|
      if subscription.ends_at < Time.now + 1.day
        subscription.plan = Plan.find_by_name('Basic Plan')
        subscription.save
        puts "subscription changed for #{subscription.user.email}"
      else
        puts "Subscription Active for #{subscription.user.email}"
      end
    end
  end

end
