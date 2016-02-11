---
title: Redeploy
layout: paas_guides
---

# Redeploy

```
Usage: catalyze redeploy SERVICE_NAME

Redeploy a service without having to do a git push

Arguments:
  SERVICE_NAME=""   The name of the service to redeploy (i.e. 'app01')
```

`redeploy` restarts a service without having to perform a code push. Typically when you want to update your code service you make a code change, git commit, then `git push catalyze master`. After the build finishes and a couple minutes later your code service will be redeployed. With the redeploy command, you skip the git push and the build. Here is a sample command

```
catalyze redeploy app01
```
