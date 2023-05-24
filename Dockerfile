FROM ruby:3.0.6
RUN apt-get update -qq && apt-get install -y libpq-dev
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 2000

# Start the main process.
CMD ["sh", "-c", "rails db:migrate && rails server -b 0.0.0.0"]
