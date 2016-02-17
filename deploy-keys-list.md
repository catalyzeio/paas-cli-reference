---
title: Deploy Keys List
layout: paas_guides
---

# Deploy Keys List

```
Usage: catalyze deploy-keys list SERVICE_NAME [--include-keys]

List all deploy keys

Arguments:
  SERVICE_NAME=""   The name of the code service to list deploy keys

Options:
  --include-keys=false   Print out the values of the deploy keys, as well as names
```

`deploy-keys list` will list all of your previously uploaded deploy keys by name. Optionally including the key's fingerprint in SHA256 format if the `--include-keys` flag is specified as well. Here is a sample command

```
catalyze deploy-keys list app01 --include-keys
```
