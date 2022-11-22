namespace :check_subscriptions do
  desc "TODO"
  task customer: :environment do
    @users = User.joins(:subscription)
    @users.each do |user|
      if user.subscription.ends_at < Time.now 
        user.subscription.plan = Plan.find_by_name('Basic Plan')
        user.save
        puts "subscription changed for #{user.email}"
      else
        puts "Subscription Active for #{user.email}"
      end
    end
  end

end
