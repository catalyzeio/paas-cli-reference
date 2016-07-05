---
title: Clear
layout: paas_cli
---

# Clear

```
Usage: catalyze clear [--private-key] [--session] [--environments] [--default] [--pods] [--all]

Clear out information in the global settings file to fix a misconfigured CLI.

Options:
  --private-key=false    Clear out the saved private key information
  --session=false        Clear out all session information
  --environments=false   Clear out all associated environments
  --default=false        Clear out the saved default environment
  --pods=false           Clear out all saved pods
  --all=false            Clear out all settings
```

`clear` allows you to manage your global settings file in case your CLI becomes misconfigured. The global settings file is stored in your home directory at `~/.catalyze`. You can clear out all settings or pick and choose which ones need removed. After running the `clear` command, any other CLI command will reset the removed settings to their appropriate values. Here are some sample commands

```
catalyze clear --all
catalyze clear --environments # removes your associated environments
catalyze clear --session --private-key # removes all session and private key authentication information
```
