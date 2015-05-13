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

export CONFTEMPLATE=/usr/local/share/haproxy.cfg.tmpl
export CONFFILE=/usr/local/etc/haproxy/haproxy.cfg
export SCORCH=/usr/bin/scorch
export HAPROXY=/usr/local/sbin/haproxy
export PEMTEMPLATE=/usr/local/share/haproxy.pem.tmpl
export PEMFILE=/usr/local/etc/haproxy/haproxy.pem

if [[ "x$KEY" != "x" ]]; then
  $SCORCH -e $PEMTEMPLATE > $PEMFILE
  ls -la $PEMFILE
fi

$SCORCH -e $CONFTEMPLATE > $CONFFILE
ls -la $CONFFILE

exec $HAPROXY -db -f $CONFFILE
