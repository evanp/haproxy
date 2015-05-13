FROM haproxy:1.5
MAINTAINER Evan Prodromou <evan@fuzzy.io>

RUN echo "deb http://ftp.us.debian.org/debian wheezy-backports main" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
  nodejs=0.10.29~dfsg-1~bpo70+1 \
  nodejs-legacy=0.10.29~dfsg-1~bpo70+1 \
  curl
RUN curl -L --insecure -O https://www.npmjs.org/install.sh \
      && /bin/bash install.sh
RUN npm install -g scorch@0.2.0

ADD haproxy.cfg.tmpl /usr/local/share/
ADD haproxy.pem.tmpl /usr/local/share/
ADD haproxy-start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/haproxy-start.sh

ENTRYPOINT /usr/local/bin/haproxy-start.sh
