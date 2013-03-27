class PagesController < ApplicationController
  def search
    @repos = params[:search].blank? ? [] : Octokit.repositories(params[:search])
    @user = params[:search].blank? ? [] : Octokit.user(params[:search])
  end
  def mail
    ResumeMailer.resume_email(params[:email], params[:search]).deliver
    redirect_to root_path, notice: "Email Sent."
  end
end
