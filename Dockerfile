# Fetch ruby Image
FROM ruby:2.6.3

# Setting default args, args are overridden in docker-compose.override.yml
ARG BUNDLER_OPTS="--jobs=5 --retry=3 --without development test"
ARG RAILS_ENVIRONMENT="production"

# Setting Environment based on arg
ENV RAILS_ENV=${RAILS_ENVIRONMENT}

# Install dependencies
RUN apt-get update && apt-get install -y postgresql-client

# Create and set application work directory
RUN mkdir /graphql-test
WORKDIR /graphql-test

# Copy Gemfiles
COPY Gemfile /graphql-test/Gemfile
COPY Gemfile.lock /graphql-test/Gemfile.lock

# Install gems
RUN bundle install ${BUNDLER_OPTS}

# Copy project's files
COPY . /graphql-test

# Expose port
EXPOSE 3000

CMD puma -C config/puma.rb
