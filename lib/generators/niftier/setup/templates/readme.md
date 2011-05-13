# APP

[url](http://somewhere.com/)

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
      url = git@github.com:gc-designstudio/APP.git
    [remote "staging"]
      url = git@heroku.com:APP-staging.git
      fetch = +refs/heads/*:refs/remotes/staging/*
    [remote "production"]
      url = git@heroku.com:APP.git
      fetch = +refs/heads/*:refs/remotes/production/*
    [remote "heroku"]
      url = git@heroku.com:APP.git
      fetch = +refs/heads/*:refs/remotes/heroku/*

## Heroku CLI:

Heroku command most include --app:

`$ heroku rake db:migrate --app APP-staging`

## Common commands:
Importing the production DB in local ENV:

`$ heroku rake db:pull --app {APP_NAME}`

## Staging ENV:

Heroku app name: **APP-staging**

[http://APP-staging.heroku.com/](http://APP-staging.heroku.com/)

[Managing Multiple Environments for an App](http://devcenter.heroku.com/articles/multiple-environments)

### Staging configuration

With a production App:

`$ heroku addons`

It will list your custom addons plus the defaults ones... therefore, in the next command you only need to add the custom addons. (coma separated without spaces!)

`$ heroku create APP-staging --stack bamboo-mri-1.9.2 --remote staging --addons custom_domains:basic,memcache:5mb,newrelic:bronze,sendgrid:free,zerigo_dns:basic`
`$ heroku config:add RACK_ENV=staging --app APP-staging`
`$ git push staging master`

Update the proper settings ,then:

`$ git push staging master`
`$ heroku rake db:migrate --app APP-staging`
`$ heroku db:push --app APP-staging`

## Legal
[URL](http://somewhere.com)
