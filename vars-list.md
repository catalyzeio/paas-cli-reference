---
title: Vars List
layout: paas_cli
---

## Vars List

```
Usage: catalyze vars list [--json | --yaml]

List all environment variables

Options:
  --json=false   Output environment variables in JSON format
  --yaml=false   Output environment variables in YAML format
```

`vars list` prints out all known environment variables for the associated code service. You can print out environment variables in JSON or YAML format through the `--json` or `--yaml` flags. Here are some sample commands

```
catalyze vars list
catalyze vars list --json
```
