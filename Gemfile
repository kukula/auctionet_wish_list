source 'https://rubygems.org'

gem 'rails', '>= 5.0.0.beta1', '< 5.1'

gem 'pg'

gem 'uglifier', '>= 1.3.0'
gem 'sass-rails', github: 'rails/sass-rails', branch: 'master'
gem 'sprockets-rails', github: 'rails/sprockets-rails', branch: 'master'
gem 'sprockets', github: 'rails/sprockets', branch: 'master'
gem 'babel-transpiler'
gem 'bootstrap-sass', '~> 3.3.6'

gem 'turbolinks'
gem 'jquery-rails'
gem 'slim-rails'

gem 'puma'
gem 'auctionet', '0.1.0', path: './lib/auctionet/'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
end

group :development, :test do
  gem 'byebug'
  gem 'spring'
  gem 'rspec-rails', git: 'https://github.com/rspec/rspec-rails.git', branch: 'master'
  gem 'rspec-core', git: 'https://github.com/rspec/rspec-core.git', branch: 'master'
  gem 'rspec-support', git: 'https://github.com/rspec/rspec-support.git', branch: 'master'
  gem 'rspec-expectations', git: 'https://github.com/rspec/rspec-expectations.git', branch: 'master'
  gem 'rspec-mocks', git: 'https://github.com/rspec/rspec-mocks.git', branch: 'master'
end

group :test do
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
end
