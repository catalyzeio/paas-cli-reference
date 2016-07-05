---
title: Sites Create
layout: paas_cli
---

## Sites Create

```
Usage: catalyze sites create SITE_NAME SERVICE_NAME HOSTNAME [--client-max-body-size] [--proxy-connect-timeout] [--proxy-read-timeout] [--proxy-send-timeout] [--proxy-upstream-timeout] [--enable-cors] [--enable-websockets]

Create a new site linking it to an existing cert instance

Arguments:
  SITE_NAME=""      The name of the site to be created. This will be used in this site's nginx configuration file (i.e. ".example.com")
  SERVICE_NAME=""   The name of the service to add this site configuration to (i.e. 'app01')
  HOSTNAME=""       The hostname used in the creation of a certs instance with the 'certs' command (i.e. "star_example_com")

Options:
  --client-max-body-size=-1     The 'client_max_body_size' nginx config specified in megabytes
  --proxy-connect-timeout=-1    The 'proxy_connect_timeout' nginx config specified in seconds
  --proxy-read-timeout=-1       The 'proxy_read_timeout' nginx config specified in seconds
  --proxy-send-timeout=-1       The 'proxy_send_timeout' nginx config specified in seconds
  --proxy-upstream-timeout=-1   The 'proxy_next_upstream_timeout' nginx config specified in seconds
  --enable-cors=false           Enable or disable all features related to full CORS support
  --enable-websockets=false     Enable or disable all features related to full websockets support
```

`sites create` allows you to create a site configuration that is tied to a single service. To create a site, you must first [create a cert](#certs-create). A site has three pieces of information, a name, the service it's tied to, and the cert instance it will use. The name is the `server_name` that will be injected into this site's Nginx configuration file. It is important that this site name match what URL your site will respond to. If this is a bare domain, using `mysite.com` is sufficient. If it should respond to the APEX domain and all subdomains, it should be named `.mysite.com` notice the leading `.`. The service is a code service that will use this site configuration. Lastly, the cert instance must be specified by the `HOSTNAME` argument used in the [certs create](#certs-create) command. You can also set Nginx configuration values directly by specifying one of the above flags. Here are some sample commands

```
catalyze sites create .mysite.com app01 wildcard_mysitecom
catalyze sites create .mysite.com app01 wildcard_mysitecom --client-max-body-size 50 --enable-cors
```
