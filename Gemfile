source 'https://rubygems.org'
ruby '2.4.1'

gem 'bootstrap-sass'
gem 'jbuilder'
gem 'jquery-ui-rails'
gem 'jquery-rails'
gem 'nokogiri'
gem 'rails', '~>5.1.0'
gem 'rails-flog'
gem 'rails-i18n'
gem 'rqrcode'
gem 'rqrcode_png'
gem 'thread_safe'
gem 'turbolinks'
gem 'uglifier'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

group :assets do
  gem 'sprockets-rails', :git => 'https://github.com/rails/sprockets-rails.git'
  gem 'coffee-rails', :git => 'https://github.com/rails/coffee-rails.git'
  gem 'sass-rails', :git => 'https://github.com/rails/sass-rails.git'
end
group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :development, :test do
  gem 'mysql2', '~> 0.3.18'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :test do
  gem 'rake'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'turnip'
  gem "poltergeist"
  gem 'database_cleaner'
end

group :production do
  gem 'mysql2', '~> 0.3.18'
  gem 'rails_12factor'
end
