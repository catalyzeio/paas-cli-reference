---
title: Rollback
layout: paas_cli
---

# Rollback

```
Usage: catalyze rollback SERVICE_NAME RELEASE_NAME

Rollback a code service to a specific release

Arguments:
  SERVICE_NAME=""   The name of the service to rollback
  RELEASE_NAME=""   The name of the release to rollback to
```

`rollback` is a way to redeploy older versions of your code service. You must specify the name of the service to rollback and the name of an existing release to rollback to. Releases can be found with the [releases list](#releases-list) command. Here are some sample commands

```
catalyze rollback code-1 f93ced037f828dcaabccfc825e6d8d32cc5a1883
```
