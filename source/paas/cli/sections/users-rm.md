---
title: Users RM
layout: paas_guides
---

# Users RM

```
Usage: catalyze users rm USER_ID

Revoke access to the associated environment for the given user

Arguments:
  USER_ID=""   The Users ID to revoke access from for the associated environment
```

`users rm` revokes a users access to your environment. This is the opposite of the [users add](https://resources.catalyze.io/paas/cli/sections/users-add/) command. Here is a sample command

```
catalyze users rm 774bf982-fc4a-428b-a048-c38cffb7d0ab
```
