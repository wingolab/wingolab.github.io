ARG version=3.8
FROM jekyll/jekyll:${version}

COPY ./Gemfile /srv/jekyll/

RUN gem install bundler && bundle install
