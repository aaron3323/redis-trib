FROM centos:7
MAINTAINER jimmy

WORKDIR /app

RUN yum install -y epel-release
RUN yum install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum --enablerepo=remi install -y redis wget && wget http://download.redis.io/redis-stable/src/redis-trib.rb

ENTRYPOINT ["ruby", "redis-trib.rb"]
