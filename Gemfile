source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.0'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'rails_12factor'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.14'
  gem 'factory_girl_rails', '~> 4.4'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
  gem 'aws-sdk'
end
