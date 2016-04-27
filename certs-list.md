---
title: Certs List
layout: paas_cli
---

# Certs List

```
Usage: catalyze certs list

List all existing domains that have SSL certificate and private key pairs
```

`certs list` lists all of the available certs you have created on your environment. The displayed names are the names that should be used as the `DOMAIN` parameter in the [sites create](https://resources.catalyze.io/paas/cli/sections/sites-create/) command. Here is a sample command

```
catalyze certs list
```
