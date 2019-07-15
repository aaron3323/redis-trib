FROM centos:7
MAINTAINER jimmy

WORKDIR /app

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh
RUN rvm install 2.5
RUN ruby -v

RUN yum install -y epel-release
RUN yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum --enablerepo=remi install -y redis wget && wget http://download.redis.io/redis-stable/src/redis-trib.rb

ENTRYPOINT ["ruby", "redis-trib.rb"]
