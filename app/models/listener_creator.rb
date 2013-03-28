class ListenerCreator
  def initialize(email)
    @listener = Listener.where(email: email).first_or_create!
  end
  def listen_to(username)
    repos = Github.user_repos(username).collect{|repo| repo.id}
    user = User.where(username: username).first_or_initialize
    @listener.subscriptions << Subscription.new( user: user, listener: @listener, repo_ids: repos)
  end
end
