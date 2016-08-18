---
title: Domain
layout: paas_cli
---

# Domain

```
Usage: catalyze domain

Print out the temporary domain name of the environment
```

The `default` command has been deprecated! It will be removed in a future version. Please specify `-E` on all commands instead of using the default.

`domain` prints out the temporary domain name setup by Catalyze for an environment. This domain name usually takes the form podXXXXX.catalyzeapps.com but may vary based on the environment. Here is a sample command

```
catalyze domain
```
