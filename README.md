# haproxy

Dockerized version of HAProxy that you configure with environment variables.

This is principally for HTTP and HTTPS. If you're using HAProxy for another
kind of server, let me know.

# Public domain dedication

Written in 2015 by Evan Prodromou <evan@prodromou.name>

To the extent possible under law, the author(s) have dedicated all copyright and
related and neighboring rights to this software to the public domain worldwide.
This software is distributed without any warranty.

You should have received a copy of the CC0 Public Domain Dedication along with
this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# HTTP

To make it work for HTTP in the front and HTTP in the back, just set the
BACKEND_SERVERS variable to a comma-separated array of "address:port" strings,
like this:

  127.0.1.1:80,127.0.1.2:80,127.0.1.3:80

If you're not listening on the default 80 port, set PORT, too.

# HTTPS with SSL Termination

If you're using HTTPS for your front-end and HTTP for the back-end, you need to
set the KEY and CERT variables to the key and certificate for the server.

NOTE: These are the actually key and cert, not the filenames. Stick 'em right in
your docker-compose.yml, yo.

If you've got a KEY and CERT, the default port will be 443.

You still need to set the BACKEND_SERVERS variable, of course.

# HTTPS with SSL Pass-through

If you're using HTTPS with SSL pass-through, set the SSL_PASSTHROUGH variable to
something truthy (1, 'true'). Your back-end will need to have its own SSL set up.

If you've got SSL_PASSTHROUGH, the default port will be 443.

You still need to set the BACKEND_SERVERS variable.

# Configuration

This makes it possible to configure HAProxy with environment variables, which
is pretty nice if you're using docker-compose.

## BACKEND_SERVERS

Backend servers, in "address:port" format.

## PORT

Port to listen on; defaults to 80 if no key or 443 if there's a key.

## KEY

If you're doing SSL termination, data (not file name!) for the SSL key.
Defaults to none, meaning don't use SSL.

## CERT

Data (not file name!) for the SSL cert. Defaults to none, meaning don't use SSL.

## GLOBAL_MAXCONN

Global maximum connections; defaults to 256.

## SERVER_MAXCONN

Maximum connections per server; defaults to 32.

## SSL_PASSTHROUGH

Set this to something truthy (0, 1, 'false', 'true') to use SSL passthrough mode.
