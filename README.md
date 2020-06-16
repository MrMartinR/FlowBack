# README

Prerequisites
The setups steps expect following tools installed on the system.

Github
Ruby 2.6.5
Rails 6.0.2.2
1. Check out the repository
git clone git@github.com:FlowFintech/FlowBack.git
2. Edit database.yml file
   (database configuration as required.)
3. run 'bundle install'
   ( setup the library / gem that needed on this project using bundler)
4. Create and setup the database
Run the following commands to create and setup the database.

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed

5. Start the Rails server
You can start the rails server using the command given below.

bundle exec rails s -p 3000
And now you can visit / Access the API To this URL http://localhost:3000