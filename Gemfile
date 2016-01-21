source "https://rubygems.org"

gem "chef", "~> #{ENV.fetch("CHEF_VERSION", "12.5")}"
gem "chefspec", "~> 4.5"

gem "berkshelf", "~> 4.0"
gem "foodcritic", "~> 6.0"
gem "license_finder", "~> 2.0"
gem "rake", "~> 10.5"
gem "rubocop", "~> 0.36.0"
gem "serverspec", "~> 2.29"

group :integration do
  gem "busser-serverspec", "~> 0.6.0"
  gem "guard-rspec", "~> 4.6.4"
  gem "guard-rubocop", "~> 1.2.0"
  gem "kitchen-vagrant", "~> 0.19.0"
  gem "test-kitchen", "~> 1.4.2"
end
