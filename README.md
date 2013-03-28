# GH Resume

I currently have the application running on heroku at [http://gh-resume.herokuapp.com/](http://gh-resume.herokuapp.com/).  The emails are sent out on an hourly basis via the heroku scheduler.  Additionally the listener emails are sent out daily via the scheuler also.

To install the application you will need postgresql and ruby 1.9.3+

To run locally, run:

    bundle install
    rake db:create && db:migrate

Set the environment variables in the .env file, like below:

    SENDGRID_USERNAME=username
    SENDGRID_PASSWORD=password
    GH_LOGIN=github_login
    GH_PASSWORD=github_password

To run on heroku run:

    heroku create
    git push heroku master
    heroku config:add SENDGRID_USERNAME=username SENDGRID_PASSWORD=password GH_LOGIN=github_login GH_PASSWORD=github_password

This will run the primary app, but the mailer is handled by delayed job which requires running a rake task.

After signing up for emails and update requests you can run the mailers via rake:

### Locally

    rake jobs:work
    rake subscriptions:send_emails

### Heroku

    heroku run rake jobs:work
    heroku run rake subscriptions:send_emails

