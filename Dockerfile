FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /bindit
WORKDIR /bindit
ADD Gemfile /bindit/Gemfile
ADD Gemfile.lock /bindit/Gemfile.lock
RUN bundle install
ADD . /bindit

FROM abevoelker/ruby:latest # based on ubuntu
ENV TERM linux
RUN apt-get update && apt-get install -y .....

ENV DISPLAY :99

# Install Xvfb init script
ADD xvfb_init /etc/init.d/xvfb # default xvfb init.d
RUN chmod a+x /etc/init.d/xvfb

CMD ["firefox"]
