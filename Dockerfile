FROM ruby:2.6.3


ENV APP_ROOT /app

WORKDIR $APP_ROOT

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN \
  gem install bundler:2.0.2 && \
  bundle install && \
  rm -rf ~/.gem

ADD . $APP_ROOT

EXPOSE  4567
CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0"]