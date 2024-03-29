class ResumeMailer < ActionMailer::Base
  default from: "admin@gh-resume.herokuapp.com"

  def resume_email(user_email, user_name)
    @user = Github.user_information(user_name)
    @repos = Github.user_repos(user_name)
    mail(:to => user_email, :subject => "Github Resume for #{user_name}")
  end

  def new_repo_email(user_email, repo, user_name)
    @repo = repo
    @user = Github.user_information(user_name)
    mail(:to => user_email, :subject => "Github Resume for #{user_name}")
  end
end
