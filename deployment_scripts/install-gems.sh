#!/bin/bash 

# Go to the deployment directory
cd /var/www/sample_app/deployment

# Get temporaray credentials for AWS CodeCommit
# - Remember that the instance must have access rights to the CodeCommit repositories in Gemfile.
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

# Install gems using bundler
# - Bundle location: /var/www/sample_app/shared/bundle
# - Binary location: /var/www/sample_app/shared/bin
# - Without development and test gems
# - Using gemfile in current directory
# - Also quietly. No need to generate all logs.
RAILS_ENV=production bundle install --binstubs /var/www/sample_app/shared/bin --gemfile ./Gemfile --path /var/www/sample_app/shared/bundle --without development test --deployment --quiet
