#!/bin/bash

set -e
set -x

export TEMPLATE=/usr/local/share/haproxy.cfg.tmpl
export CONFFILE=/usr/local/etc/haproxy/haproxy.cfg
export SCORCH=/usr/bin/scorch
export HAPROXY=/usr/local/sbin/haproxy

echo START

$SCORCH -e $TEMPLATE > $CONFFILE

echo NEXT

exec $HAPROXY -db -f $CONFFILE

echo DONE
