namespace :subscriptions do
  desc "Send out emails for github listeners"
  task send_emails: :environment do
    User.all.each do |user|
      SubscriptionChecker.new(user).process_user
    end
  end
end
