# README

Prerequisites
The setups steps expect following tools installed on the system.

Github<br/>
Ruby 2.6.5<br/>
Rails 6.0.2.2<br/>
Postgresql with pgcrypto extension enabled<br/>

how to run:
1. Check out the repository
git clone git@github.com:FlowFintech/FlowBack.git
<br/>
2. Edit database.yml file
   (database configuration as required.)
   <br/>
3. run 'bundle install'
   ( setup the library / gem that needed on this project using bundler)
4. Create and setup the database
Run the following commands to create and setup the database.
<br/>
bundle exec rake db:create<br/>
bundle exec rake db:migrate<br/>
bundle exec rake db:seed<br/>

5. Start the Rails server
You can start the rails server using the command given below.

bundle exec rails s -p 3000
And now you can visit / Access the API To this URL http://localhost:3000