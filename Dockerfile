FROM centos/ruby-25-centos7
MAINTAINER jimmy

USER root

WORKDIR /app

RUN yum install -y epel-release
RUN yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum --enablerepo=remi install -y redis wget && wget http://download.redis.io/redis-stable/src/redis-trib.rb

ENV PATH /opt/rh/rh-ruby25/root/usr/local/bin:/opt/rh/rh-ruby25/root/usr/bin:$PATH

ENTRYPOINT ["ruby", "redis-trib.rb"]
