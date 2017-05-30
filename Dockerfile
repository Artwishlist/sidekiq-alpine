FROM ruby:2.4.1-alpine

# Get required packages
RUN apk add --no-cache \
    build-base

# Set up working directory
ENV DIR sidekiq
RUN mkdir /$DIR
WORKDIR /$DIR

# Set up gems
ADD Gemfile ./
ADD Gemfile.lock ./
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

# Finally, add the rest of our app's code
ADD ./ ./

EXPOSE 80

CMD ["bundle", "exec", "thin", "start", "-p", "80"]
