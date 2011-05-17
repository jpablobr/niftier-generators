# Niftier Generators (not really)

A collection of useful Rails generator scripts for scaffolding, layout files, authentication, and more.

## Setup

### Rails 3

Add the gem to your Gemfile.

    gem "niftier-generators", :group #> :development

Then you can run any of the included generators.

    rails g niftier:scaffold Recipe name:string index new

### Rails 2

First install the gem.

    gem install niftier-generators

The generators will be available in all Rails applications. To run the generator, go to your rails project directory and call it using the script/generate or script/destroy command.

    script/generate niftier_scaffold Recipe name:string index new

Note an underscore is used instead of a colon for the Rails 2 generators.


## Included Generators

* niftier:layout: generates generic layout, stylesheet, and helper files.
* niftier:scaffold: generates a controller and optional model/migration.
* niftier:authentication: generates user model with sign up and log in.
* niftier:setup: generates misc files such as .rvmrc, gitignore, rake tasks, etc...

To view the README for each generator, run it with the +help+ option.

    rails g niftier:layout --help


## Troubleshooting and FAQs

What is the difference between niftier:scaffold and built-in scaffold?

One of the primary differences is that niftier:scaffold allows you to choose which controller actions to generate.

    rails g niftier:scaffold post name:string index new edit

There are a few changes to the generated code as well, such as no XML format by default.

It also offers support for HAML, Shoulda, and RSpec.


    I get "undefined method 'title'" error.

Try running niftier:layout, that will generate this helper method. Or you can just change the templates to whatever approach you prefer for setting the title.


    I can't set new attributes in my model.

Add the attribute to the attr_accessible line in the model.


    I get "undefined method 'root_url'" error.

Some generators default redirecting to the root_url. Set this in your routes.rb file like this (substituting your controller name).

    root :to #> "home#index"


I get a missing database error.

Run **rake db:migrate**.


I get a routing error when I try to submit a form.

Try restarting your development server. Sometimes it doesn't detect the change in the routing.


The tests/specs don't work.

Make sure you have mocha installed and require it in your spec/test helper.

      gem install mocha

      # in spec_helper.rb
      config.mock_with :mocha

      # in test_helper.rb
      require 'mocha'

Also, make sure you're using Rails 2.1 or greater.

## Found a bug?

If you are having a problem with Niftier Generators, first look at the FAQs above. If you still cannot resolve it, please submit an issue here.

http://github.com/jpablobr/niftier-generators/issues

## Development

If you want to contribute to this project, you can download the Git repository and get the Cucumber features running by calling +bundle+ then +rake+. I normally develop this using Ruby 1.9.2 however it should work with 1.8.7 as well.

The Rails 3 generators are located under **lib/generators** and are tested with Cucumber. The older Rails 2 generators are under **rails_generators** and are tested with Shoulda under the **test** directory.

## Credits

This is just a modified version of [Ryan Bates](https://github.com/ryanb) original [nifty-generators](https://github.com/ryanb/nifty-generators)

## Licence

Copyright (c) 2011 Jose Pablo Barrantes

See [LICENSE](https://github.com/jpablobr/niftier-generators/blob/master/LICENSE)
