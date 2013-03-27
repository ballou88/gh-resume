class PagesController < ApplicationController
  def search
    @repos = params['search'].blank? ? [] : Octokit.repositories(params['search'])
    @user = params['search'].blank? ? [] : Octokit.user(params['search'])
  end
end
