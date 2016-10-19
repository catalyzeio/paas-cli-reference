---
title: Vars List
layout: paas_cli
---

## Vars List

```
Usage: catalyze vars list [SERVICE_NAME] [--json | --yaml]

List all environment variables

Arguments:
  SERVICE_NAME=""   The name of the service containing the environment variables. Defaults to the associated service.

Options:
  --json=false   Output environment variables in JSON format
  --yaml=false   Output environment variables in YAML format
```

`vars list` prints out all known environment variables for the given code service. You can print out environment variables in JSON or YAML format through the `--json` or `--yaml` flags. Here are some sample commands

```
catalyze vars list code-1
catalyze vars list code-1 --json
```
