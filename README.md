# Application Simple Template for Rails5

Rails5 Simple Application Template. - [Rails Application Templates — Ruby on Rails Guides](http://guides.rubyonrails.org/rails_application_templates.html)

It's enhanced version of [morizyun/rails5_application_template](https://github.com/morizyun/rails5_application_template).

## Preparation

### Upgrading ruby version in rbenv

Fill following commands:

```
# Update Homebrew
$ brew update

# Generate modern .gitignore
$ brew install gibo

# Install automake for ffi instalation fails
$ brew install automake

# Install yarn for webpacker
$ brew install yarn

# Update ruby-build
$ brew upgrade ruby-build

# Show some ruby versions which rbenv can install
$ rbenv install --list

# Install latest Ruby(e.g. 2.5.0)
$ rbenv install 2.5.0
```

### Install latest Rails gem

```
# Set to use rails latest version(e.g. 5.1.5)
$ gem install rails -v 5.1.5
```

## Execution command

Execute following commands:

```
# Execute following command;
$ rails new _your_app_name_ --force --skip-bundle -m https://raw.github.com/shibukk/rails5_application_template/master/template.rb

# After you create rails project, then there is no more need to use the directories.
$ cd _your_app_name_
$ rm -rf vendor/bundle
$ rm -rf node_modules

# Start up your application
$ docker-compose up

# e.g. Generate controller
$ docker-compose run web rails g controller test
```

## Thanks!

Description of this template in Japanese is as follows;

**[Rails 5.0.0 + Bootstrap 1コマンドで！ - 酒と泪とRubyとRailsと](http://morizyun.github.io/blog/rails5-application-templates/)**