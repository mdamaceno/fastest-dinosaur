FROM ruby:3.0.1

ADD Gemfile /usr/src/app/Gemfile
WORKDIR /usr/src/app
RUN cd /usr/src/app && bundle install
COPY . /usr/src/app
