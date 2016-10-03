FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs


# for a linux container enviroment manager
RUN curl -sSL https://get.docker.com/ | sh
RUN systemctl enable docker


ENV APP_HOME /usr/src/app
RUN mkdir $APP_HOME

WORKDIR $APP_HOME


ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile 
RUN bundle install

ADD . $APP_HOME