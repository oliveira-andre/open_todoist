FROM ruby:2.7.1

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  nodejs yarn build-essential libpq-dev imagemagick git-all vim


ENV INSTALL_PATH /var/www/web_app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./

RUN bundle install
RUN yarn install

COPY . .

EXPOSE 3334

