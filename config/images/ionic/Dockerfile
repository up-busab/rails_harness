FROM webratio/nodejs-with-android-sdk:12.13.1

ENV CORDOVA_VERSION 9.0.0
ENV IONIC_VERSION 5.2.3

WORKDIR "/tmp"

RUN apt-get -qq update && \
    apt-get -qq install -y iputils-ping wget curl git maven ant gradle vim

RUN npm i -g --unsafe-perm cordova@${CORDOVA_VERSION}

RUN apt-get update && apt-get install -y git bzip2 openssh-client && \
    npm i -g --unsafe-perm ionic@${IONIC_VERSION} && \
    ionic --no-interactive config set -g daemon.updates false && \
    rm -rf /var/lib/apt/lists/* && apt-get clean

#fake some apple stuff
RUN echo "#!/bin/bash" > /usr/local/bin/pod && echo "echo 'passing through fake pod...'" >> /usr/local/bin/pod
RUN echo "#!/bin/bash" > /usr/local/bin/xcodebuild && echo "echo 'passing through fake xcodebuild...'" >> /usr/local/bin/xcodebuild
RUN chmod 777 /usr/local/bin/pod
RUN chmod 777 /usr/local/bin/xcodebuild

EXPOSE 8100

#RUN apt-get update -y && apt-get install -y rubygems ruby-dev build-essential
#RUN apt-get update -y && apt-get install -y libpng-dev libpng16-16 libxml2-dev cmake pkg-config ninja-build

#RUN gem install cocoapods
#RUN gem install travis

#RUN git clone --depth=1 https://github.com/facebook/xcbuild
#RUN cd xcbuild && git submodule update --init && make && make install

