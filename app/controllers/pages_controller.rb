class PagesController < ApplicationController
  def search
    @repos = Github.user_repos(params[:search])
    @user = Github.user_information(params[:search])
  end
  def mail
    ResumeMailer.delay.resume_email(params[:email].first, params[:username])
    redirect_to root_path, notice: "Email Sent."
  end
end
