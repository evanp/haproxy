#!/bin/bash

# Written in 2015 by Evan Prodromou <evan@prodromou.name>
#
# To the extent possible under law, the author(s) have dedicated all copyright and
# related and neighboring rights to this software to the public domain worldwide.
# This software is distributed without any warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

set -e

export TEMPLATE=/usr/local/share/haproxy.cfg.tmpl
export CONFFILE=/usr/local/etc/haproxy/haproxy.cfg
export SCORCH=/usr/bin/scorch
export HAPROXY=/usr/local/sbin/haproxy

if [[ "x$KEY" != "x" ]]; then
  echo $KEY $CERT > /usr/local/etc/haproxy/haproxy.pem
fi

$SCORCH -e $TEMPLATE > $CONFFILE

exec $HAPROXY -db -f $CONFFILE
