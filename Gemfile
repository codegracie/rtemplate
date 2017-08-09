source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '4.2.5'
gem 'sass-rails',           '~> 5.0'
gem 'uglifier',             '>= 1.3.0'
gem 'coffee-rails',         '~> 4.1.0'
gem 'turbolinks'
gem 'jbuilder',             '~> 2.0'
gem 'sdoc',                 '~> 0.4.0', group: :doc

gem 'bootstrap',            '~> 4.0.0.alpha6'
gem 'jquery-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt',               '~> 3.1.11'

gem 'will_paginate',        '~> 3.1', '>= 3.1.5'
gem 'bootstrap-will_paginate', '~> 1.0'
gem 'faker',                '1.7.3'
gem 'carrierwave',          '1.1.0'
gem 'mini_magick',          '4.7.0'
gem 'fog',                  '1.40.0'


# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'sqlite3'  #Cloud9 - development mode
end

group :production do
  gem 'pg'  #Heroku -- postgresql  
  gem 'rails_12factor', '~> 0.0.3'
  gem 'puma',           '2.11.1'
end



