FROM ruby:2.2.4-slim

RUN apt-get update -qq && apt-get install --no-install-recommends -y \
  g++  \
  gcc  \
  git  \
  make \
  zip

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE 80

CMD ["thin", "-p", "80", "start"]
