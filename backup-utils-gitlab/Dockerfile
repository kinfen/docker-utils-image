FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
// TODO not complete
MAINTAINER Kinfen
# ENV DIR=/home/git
# RUN apk add curl bash
# RUN mkdir -p $DIR && cd  $DIR
# RUN curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.node.sh | bash
# WORKDIR $DIR
ENV GITLAB_TAG=v11.0.5
ENV GIT_HOME=/home/git

ENV FQDN=localhost
ENV EMAIL_FROM=kinfen.in@gmail.com
ENV EMAIL_REPLY_TO=kinfen.in@gmail.com

RUN apk add -U \
	openssh-server \
	logrotate \
	rsync \
	yarn \
	nodejs \
	ruby=~2.5 \
	sudo \
	git

# create git user and config git
RUN addgroup -S git \
	&& adduser -S -D -h $GIT_HOME -s /bin/sh -G git -g git git \
	&& sudo -u git -H git config --global core.autocrlf input \
	&& sudo -u git -H git config --global gc.auto 0 \
	&& sudo -u git -H git config --global repack.writeBitmaps true \
	&& sudo -u git -H git config --global receive.advertisePushOptions true

# clone gitlab repo
RUN  cd $GIT_HOME \
	&& sudo -u git -H git clone https://gitlab.com/gitlab-org/gitlab-ce.git -b $GITLAB_TAG gitlab

# fix permissions
RUN cd $GIT_HOME/gitlab \
	&& chown -R git log/ tmp/ \
	&& chmod -R u+rwX,go-w log/ \
	&& chmod -R u+rwX tmp/ \
	&& chmod -R u+rwX tmp/pids/ \
	&& chmod -R u+rwX tmp/sockets/ \
	\
	&& install -d -o git -g git -m0700 public/uploads \
	&& chmod -R u+rwX builds/ \
	&& chmod -R u+rwX shared/artifacts/ \
	&& chmod -R ug+rwX shared/pages/


# the following files may need to be edited for our config
RUN cd $GIT_HOME/gitlab \
	&& install -o git -g git config/initializers/rack_attack.rb.example config/initializers/rack_attack.rb \
	&& install -o git -g git config/gitlab.yml.example config/gitlab.yml \
	&& install -o git -g git -m0600 config/secrets.yml.example config/secrets.yml \
	&& install -o git -g git config/resque.yml.example config/resque.yml \
	&& install -o git -g git config/unicorn.rb.example config/unicorn.rb \
	&& install -o git -g git -m640 config/database.yml.postgresql config/database.yml

RUN cd $GIT_HOME/gitlab \
	sed -E -i -e "s/host: localhost/host: $FQDN/" \
		-e "s/email_from: .*/email_from: $EMAIL_FROM/" \
		-e "s/email_reply_to: .*/email_reply_to: $EMAIL_REPLY_TO/" \
		config/gitlab.yml


# install Gems
RUN cd $GIT_HOME/gitlab \
	&& apk add --virtual .build-deps \
		ruby-dev \
		ruby-bundler \
		postgresql-dev \
		build-base \
		zlib-dev \
		yaml-dev \
		libressl-dev \
		gdbm-dev \
		re2-dev \
		readline-dev \
		ncurses-dev \
		libffi-dev \
		curl-dev \
		libxml2-dev \
		libxslt-dev \
		icu-dev \
		py-docutils \
		linux-headers \
		cmake \
		go \
	&& sudo -u git -H bundle install -j$(nproc) --deployment --without development test mysql aws kerberos

# gitlab shell
RUN cd $GIT_HOME/gitlab \
	sudo -u git -H bundle exec rake gitlab:shell:install REDIS_URL=unix:/var/run/redis/redis.sock RAILS_ENV=production SKIP_STORAGE_VALIDATION=true

# gitlab-workhorse
RUN cd $GIT_HOME/gitlab \
	sudo -u git -H bundle exec rake "gitlab:workhorse:install[$GIT_HOME/gitlab-workhorse]" RAILS_ENV=production

# gitlab-pages
RUN cd $GIT_HOME \
	&& sudo -u git -H git clone https://gitlab.com/gitlab-org/gitlab-pages.git \
	&& cd gitlab-pages \
	&& sudo -u git -H git checkout v$(cat $GIT_HOME/gitlab/GITLAB_PAGES_VERSION) \
	&& sudo -u git -H make

# gitaly
RUN cd $GIT_HOME/gitlab \
	&& mkdir -p $GIT_HOME/gitaly \
	&& apk add ruby-bigdecimal ruby-irb tzdata \
	&& sudo -u git -H bundle exec rake "gitlab:gitaly:install[$GIT_HOME/gitaly,https://gitlab.com/gitlab-org/gitaly.git]" RAILS_ENV=production


