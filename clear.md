---
title: Clear
layout: paas_cli
---

# Clear

```
Usage: catalyze clear [--private-key] [--session] [--environments] [--default] [--pods]

Clear out information in the global settings file to fix a misconfigured CLI. All information will be cleared unless otherwise specified

Options:
  --private-key=true    Clear out the saved private key information
  --session=true        Clear out all session information
  --environments=true   Clear out all associated environments
  --default=true        Clear out the saved default environment
  --pods=true           Clear out all saved pods
```

`clear` allows you to manage your global settings file in case your CLI becomes misconfigured. The global settings file is stored in your home directory at `~/.catalyze`. You can clear out all settings or pick and choose which ones need removed. After running the `clear` command, any other CLI command will reset the removed settings to their appropriate values. Here are some sample commands

```
catalyze clear # clears all settings
catalyze clear --environments=false # saves your associated environments
catalyze clear --environments=false --default=false # saves your associated environments and saves your default environment
```
