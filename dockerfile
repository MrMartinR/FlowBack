#Dockerfile
FROM ruby:2.6.5
RUN  apt-get update -qq &&  apt-get install -y nodejs postgresql-client build-essential libpq-dev cron
RUN gem install bundler -v '2.2.2'
RUN mkdir /FlowBack
WORKDIR /FlowBack
COPY Gemfile /FlowBack/Gemfile
COPY Gemfile.lock /FlowBack/Gemfile.lock
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn postgresql-client build-essential libpq-dev cron
RUN bundle install
RUN yarn install
RUN yarn install --check-files
COPY . /FlowBack
CMD "rails server -b 0.0.0.0 && bundle exec whenever --update-crontab" 

