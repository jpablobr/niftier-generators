# <%= file_name %>

[url](http://<%= file_name %>.com/)

## Git:

Repos:

* **github**
* **heroku**

Plus **staging** and **production** (on heroku) for multi-environment configuration.

Sample `.git/config` file:

    [core]
      repositoryformatversion = 0
      filemode = true
      bare = false
    [branch "master"]
      remote = origin
      merge = refs/heads/master
    [remote "github"]
      fetch = +refs/heads/*:refs/remotes/origin/*
      url = git@github.com:gc-designstudio/<%= file_name %>.git
    [remote "staging"]
      url = git@heroku.com:<%= file_name %>-staging.git
      fetch = +refs/heads/*:refs/remotes/staging/*
    [remote "production"]
      url = git@heroku.com:<%= file_name %>.git
      fetch = +refs/heads/*:refs/remotes/production/*
    [remote "heroku"]
      url = git@heroku.com:<%= file_name %>.git
      fetch = +refs/heads/*:refs/remotes/heroku/*

## Heroku CLI:

Heroku command most include --app:

`$ heroku rake db:migrate --app <%= file_name %>-staging`

## Common commands:
Importing the production DB in local ENV:

`$ heroku rake db:pull --app {<%= file_name %>_NAME}`

## Staging ENV:

Heroku app name: **<%= file_name %>-staging**

[http://<%= file_name %>-staging.heroku.com/](http://<%= file_name %>-staging.heroku.com/)

[Managing Multiple Environments for an App](http://devcenter.heroku.com/articles/multiple-environments)

### Staging configuration

With a production App:

`$ heroku addons`

It will list your custom addons plus the defaults ones... therefore, in the next command you only need to add the custom addons. (coma separated without spaces!)

`$ heroku create <%= file_name %>-staging --stack bamboo-mri-1.9.2 --remote staging --addons custom_domains:basic,memcache:5mb,newrelic:bronze,sendgrid:free,zerigo_dns:basic`
`$ heroku config:add RACK_ENV=staging --app <%= file_name %>-staging`
`$ git push staging master`

Update the proper settings ,then:

`$ git push staging master`
`$ heroku rake db:migrate --app <%= file_name %>-staging`
`$ heroku db:push --app <%= file_name %>-staging`

## Legal
[URL](http://somewhere.com)
