FROM ruby:2.5.5

RUN apt-get update -qq && apt-get install -y nodejs yarn
RUN gem install bundler -v 2.0.1

WORKDIR /superci

COPY Gemfile /superci/Gemfile
COPY Gemfile.lock /superci/Gemfile.lock

RUN bundle install
COPY . /superci

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
