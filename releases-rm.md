---
title: Releases Rm
layout: paas_cli
---

## Releases Rm

```
Usage: catalyze releases rm SERVICE_NAME RELEASE_NAME

Remove a release from a code service

Arguments:
  SERVICE_NAME=""   The name of the service to remove a release from
  RELEASE_NAME=""   The name of the release to remove
```

`releases rm` removes an existing release. This is useful in the case of a misbehaving code service. Removing the release avoids the risk of rolling back to a "bad" build. Here is a sample command

```
catalyze releases rm code-1 f93ced037f828dcaabccfc825e6d8d32cc5a1883
```
