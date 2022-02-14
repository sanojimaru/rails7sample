FROM ruby:3.1

ENV APP /app
RUN apt-get update -qq && \
  apt-get install -y build-essential default-mysql-client nodejs npm && \
  npm uninstall yarn -g && \
  npm install yarn -g
RUN mkdir $APP
WORKDIR $APP
COPY Gemfile /$APP/Gemfile
COPY Gemfile.lock /$APP/Gemfile.lock
RUN bundle install
COPY . $APP
