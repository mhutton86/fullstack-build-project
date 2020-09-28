# gets the docker image of ruby 2.5 and lets us build on top of that
FROM ruby:2.7.1-slim

# install rails dependencies
RUN apt-get update -qq \
	&& apt-get install --no-install-recommends -y build-essential libpq-dev nodejs libsqlite3-dev \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

# create a folder /myapp in the docker container and go into that folder
RUN mkdir /myapp
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock from app root directory into the /myapp/ folder in the docker container
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Run bundle install to install gems inside the gemfile
RUN bundle install --jobs=5 && bundle clean --force

# Copy the whole app
COPY . /myapp