module PagesHelper
  def repo_type(repo)
    repo.fork? ? "fork" : "original"
  end
end
