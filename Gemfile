# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

    ruby '2.5.3'

gem 'bcrypt'
gem 'bootstrap-sass', '3.3.7'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'coffee-rails', '~> 4.2'
gem 'faker', '1.7.3'
gem 'kaminari'
gem 'html2slim'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.1.6'
gem 'rails_autolink'
gem 'rails-controller-testing'
gem 'rails-i18n'
gem 'ransack'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '3.1.6'


group :development, :test do
  gem 'sqlite3','1.3.13'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 4.10.0'
  gem 'minitest-reporters',       '1.1.14'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.8.0'
  gem 'selenium-webdriver'
end

group :development do
  gem 'brakeman'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 2.15.2'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg', '0.20.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
