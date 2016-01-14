FROM debian:wheezy

ENV USER ceednee

MAINTAINER ceednee@gmail.com

RUN apt-get update -qq && \
    apt-get install -qqy wget && \
    apt-get -y install build-essential

RUN echo "deb http://packages.dotdeb.org wheezy all\ndeb-src http://packages.dotdeb.org wheezy all" > /etc/apt/sources.list.d/dotdeb.list

RUN wget http://www.dotdeb.org/dotdeb.gpg -O /tmp/dotdeb.gpg && \
    apt-key add /tmp/dotdeb.gpg

#    wget http://www.dotdeb.org/dotdeb.gpg && \
#    apt-key add dotdeb.gpg && \
#    echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list


RUN echo "===> Installing python, sudo, and supporting tools..."  && \
    apt-get update  && \
    DEBIAN_FRONTEND=noninteractive                \
    apt-get install -y                            \
        python python-yaml python-jinja2 sudo git \
        curl gcc python-pip python-dev  &&        \
    \
    \
    echo "===> Installing Ansible..."   && \
    pip install ansible                 && \
    \
    \
    echo "===> Removing unused APT resources..."                  && \
    apt-get -f -y --auto-remove remove gcc python-pip python-dev  && \
    apt-get clean                                                 && \
    rm -rf /var/lib/apt/lists/*  /tmp/*                           && \
    \
    \
    echo "===> Adding hosts for convenience..."        && \
    mkdir -p /etc/ansible                              && \
    echo '[local]\nlocalhost\n' > /etc/ansible/hosts


ADD provision /tmp/ansible/common

WORKDIR /tmp/ansible/common

RUN ansible-playbook -i inventory playbook.yml \
      --connection=local --sudo -vvv

WORKDIR /
