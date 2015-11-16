---
title: Invites Send
layout: paas_guides
---

# Invites Send

```
Usage: catalyze invites send EMAIL

Send an invite to a user by email for the associated environment

Arguments:
  EMAIL=""     The email of a user to invite to the associated environment. This user does not need to have a Catalyze account prior to sending the invitation
```

`invites send` invites a new user to your environment. The only piece of information required is the email address to send the invitation to. The recipient does **not** need to have a Dashboard account in order to send them an invitation. However, they will need to have a Dashboard account to accept the invitation. Here is a sample command

```
catalyze invites send coworker@catalyze.io
```
