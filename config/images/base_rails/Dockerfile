FROM ruby:2.6.6-buster

ARG GEM_SOURCE=https://rubygems.org/
ARG RAILS_VERSION=5.2.4.1

ARG user=youser
ARG group=youser
ARG uid=1000
ARG gid=1000

ENV USER_HOME /home/${user}/

RUN addgroup --gid ${gid} ${group}                                                                      
RUN adduser --system --disabled-password --home ${USER_HOME} --uid ${uid} --gid ${gid} --shell /bin/bash ${user} 

#add sources
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq 

RUN apt-get -y install bash postgresql-client sqlite yarn vim

RUN gem install rails -v ${RAILS_VERSION} --source ${GEM_SOURCE}
RUN gem install bundler:2.1.4

RUN chmod -R 777 /usr/local/bundle/

EXPOSE 3000

USER ${user}
