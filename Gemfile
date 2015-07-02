source "https://rubygems.org"

gem "chef", "~> #{ENV.fetch("CHEF_VERSION", "12.0.3")}"
gem "chefspec", "~> 4.2.0"

gem "berkshelf", "~> 3.3.0"
gem "foodcritic", "~> 4.0.0"
gem "license_finder", "~> 1.2.0"
gem "rake", "~> 10.4.0"
gem "rubocop", "~> 0.32.1"
gem "serverspec", "~> 2.19.0"

group :integration do
  gem "busser-serverspec", "~> 0.5.3"
  gem "guard-rspec", "~> 4.5.0"
  gem "guard-rubocop", "~> 1.2.0"
  gem "kitchen-vagrant", "~> 0.18.0"
  gem "test-kitchen", "~> 1.4.1"
end
