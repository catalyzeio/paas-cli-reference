---
title: Sites RM
layout: paas_guides
---

# Sites RM

```
Usage: catalyze sites rm NAME

Remove a site configuration

Arguments:
  NAME=""      The name of the site configuration to delete
```

`sites rm` allows you to remove a site by name. Since sites cannot be updated, if you want to change the name of a site, you must `rm` the site and then [create](https://resources.catalyze.io/paas/cli/sections/sites-create/) it again. If you simply need to update your SSL certificates, you can use the [certs update](https://resources.catalyze.io/paas/cli/sections/certs-update/) command on the cert instance used by the site in question. Here is a sample command

```
catalyze sites rm mywebsite.com
```
