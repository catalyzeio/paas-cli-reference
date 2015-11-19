---
title: Users Add
layout: paas_guides
---

# Users Add

**WARNING**: This command has been deprecated. Please use [invites send](https://resources.catalyze.io/paas/cli/sections/invites-send/) instead.

```
Usage: catalyze users add USER_ID

Grant access to the associated environment for the given user

Arguments:
  USER_ID=""   The Users ID to give access to the associated environment
```

`users add` grants an existing Catalyze Dashboard user access to your environment. To give them access, request that they first run the [whoami](https://resources.catalyze.io/paas/cli/sections/whoami/) command and send you their users ID. Here is a sample command

```
catalyze users add 774bf982-fc4a-428b-a048-c38cffb7d0ab
```
