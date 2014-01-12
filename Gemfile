source 'https://rubygems.org'

gem 'rails', '4.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'jquery-rails'

# for easy adding and deleting nested attributes through javascript (ingredients in recipe)
gem 'cocoon'

# there are no assets in Rails 4
# Gems used only for assets and not required
# in production environments by default.
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  	# See https://github.com/sstephenson/execjs#readme for more supported runtimes
  	# gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.3.0'

  # needed for getting compass compatible with rails 4
  # gem 'compass-rails', github: 'milgner/compass-rails', branch: 'rails4'

  gem 'compass-rails', github: 'Compass/compass-rails', branch: 'master'
  gem 'zurb-foundation', '~> 4.0.0'

  gem 'rvm-capistrano'

group :development, :test do
	gem 'rspec-rails', '2.14.0'
	gem 'factory_girl_rails', '4.2.1'
  gem 'capistrano', '~> 2.15'
  # gem 'guard-rspec', '1.2.1'
  # gem 'guard-spork'
 	# gem 'spork', '0.9.2'
end

group :test do
  	gem 'capybara', '~> 2.1.0'
  	gem 'database_cleaner', '~> 1.0.1'
  	gem 'faker', '~> 1.1.2'
  	gem 'launchy', '~> 2.3.0'
    gem 'selenium-webdriver', '~> 2.33.0' # used for testing javascript interactions
  	gem 'guard-rspec'

  	# these are for Linux when using Guard gem
 	  # gem 'rb-inotify', '0.8.8'
  	# gem 'libnotify', '0.5.9'
  	# gem 'launchy', '2.1.0'
  	# gem 'rb-fsevent', '0.9.1', :require => false
  	# gem 'growl', '1.0.3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
