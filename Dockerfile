FROM ruby:2.6.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /docker_eco_trip
WORKDIR /docker_eco_trip
COPY Gemfile /docker_eco_trip/Gemfile
COPY Gemfile.lock /docker_eco_trip/Gemfile.lock
RUN bundle install
COPY . /docker_eco_trip

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]