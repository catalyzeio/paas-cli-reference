---
title: Keys Set
layout: paas_cli
---

## Keys Set

```
Usage: catalyze keys set PRIVATE_KEY_PATH

Set your auth key

Arguments:
  PRIVATE_KEY_PATH=""   Relative path to the private key file.
```

`keys set` allows the CLI to use an SSH key for authentication instead of the traditional username and password combination. This can be useful for automation or where shared workstations are involved. Please note that you must pass in the path to the private key and not the public key. The given key must already be added to your account by using the [keys add](#keys-add) command. Here is a sample command

```
catalyze keys set ~/.ssh/my_key
```
