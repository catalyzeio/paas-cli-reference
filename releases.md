---
title: Releases
layout: paas_cli
---

# Releases

The `releases` command allows you to manage your code service releases. A release is automatically created each time you perform a git push. The release is tagged with the git SHA of the commit. Releases are a way of tagging specific points in time of your git history. You can rollback to a specific release by using the [rollback](#rollback) command. The releases command cannot be run directly but has sub commands.
