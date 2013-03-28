class SubscriptionChecker

  def initialize(user)
    @github_user = user
  end

  def process_user
    repos = Github.user_repos(@github_user.username, sort: "created")
    repo_ids = repos.collect{|r| r.id}
    @subscriptions = @github_user.subscriptions.includes(:listener)
    @subscriptions.each do |subscription|
      new_repo_ids = repo_ids - subscription.repo_ids
      @new_repos = new_repos(repos, new_repo_ids)
      send_email_to(@new_repos, subscription.listener.email)
      subscription.repo_ids = repo_ids
      subscription.save
    end
  end

  def new_repos(repos, new_ids)
    repos.select{ |repo| new_ids.include?(repo.id)}
  end

  def send_email_to(repos, email)
    repos.each do |repo|
      ResumeMailer.delay.new_repo_email(email, repo, @github_user.username)
    end
  end

end
