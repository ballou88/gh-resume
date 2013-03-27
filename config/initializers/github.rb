Octokit.configure do |octo|
  octo.login = ENV['GH_LOGIN']
  octo.password = ENV['GH_PASSWORD']
end
