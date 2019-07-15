FROM centos:7
MAINTAINER jimmy

WORKDIR /app

RUN yum install -y epel-release redis wget && wget http://download.redis.io/redis-stable/src/redis-trib.rb

ENTRYPOINT ["ruby", "redis-trib.rb"]
