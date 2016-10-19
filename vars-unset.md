---
title: Vars Unset
layout: paas_cli
---

## Vars Unset

```
Usage: catalyze vars unset [SERVICE_NAME] VARIABLE

Unset (delete) an existing environment variable

Arguments:
  SERVICE_NAME=""   The name of the service on which the environment variables will be unset. Defaults to the associated service.
  VARIABLE=""       The name of the environment variable to unset
```

`vars unset` removes an environment variables from the given code service. Only the environment variable name is required to unset. Once environment variables are unset, a [redeploy](#redeploy) is required for the given code service to realize the variable was removed. Here is a sample command

```
catalyze vars unset code-1 AWS_ACCESS_KEY_ID
```
