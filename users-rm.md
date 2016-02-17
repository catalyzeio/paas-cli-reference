---
title: Users Rm
layout: paas_guides
---

# Users Rm

```
Usage: catalyze users rm USER_ID

Revoke access to the given organization for the given user

Arguments:
  USER_ID=""   The Users ID to revoke access from for the given organization
```

`users rm` revokes a users access to your environment's organization. This is the opposite of the [users add](https://resources.catalyze.io/paas/cli/sections/users-add/) command. Revoking a user's access to your environment's organization will revoke their access to your environment. Here is a sample command

```
catalyze users rm 774bf982-fc4a-428b-a048-c38cffb7d0ab
```
