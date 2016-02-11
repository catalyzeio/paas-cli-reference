---
title: Keys RM
layout: paas_guides
---

# Keys RM

```
Usage: catalyze keys rm NAME

Remove a public key

Arguments:
  NAME=""      The name of the key to remove.
```

`keys rm` allows you to remove an SSH key previously uploaded to your account. The name of the key can be found by using the [keys list](https://resources.catalyze.io/paas/cli/sections/keys-list/) command. Here is a sample command

```
catalyze keys rm my_prod_key
```
