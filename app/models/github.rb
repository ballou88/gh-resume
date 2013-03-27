class Github
  def self.user_repos(user_name)
    return [] if user_name.blank?
    begin
      Octokit.repositories(user_name)
    rescue
      []
    end
  end
  def self.user_information(user_name)
    return [] if user_name.blank?
    begin
      Octokit.user(user_name)
    rescue
      []
    end
  end
end
