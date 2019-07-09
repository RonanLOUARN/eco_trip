FROM ruby:2.6.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get install -y nodejs

RUN mkdir /eco_trip
WORKDIR /eco_trip

COPY Gemfile /eco_trip/Gemfile
COPY Gemfile.lock /eco_trip/Gemfile.lock

RUN bundle install

COPY . /eco_trip

CMD ["bundle", "exec", "rails", "server"]