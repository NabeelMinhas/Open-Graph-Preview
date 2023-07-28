# Base image
FROM ruby:2.7.0

# Install system dependencies
RUN apt-get update && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install project dependencies
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
    bundle install --jobs 4 --retry 3

# Copy application code
COPY . .

# Compile assets
RUN bundle exec rails assets:precompile

# Start the Rails server
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
