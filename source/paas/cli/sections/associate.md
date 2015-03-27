---
title: Associate
layout: paas_guides
---

# Associate

Usage: `catalyze associate [OPTIONS] ENV_LABEL [SERVICE_LABEL]`

  Associates the git repository in the current directory. This means that the service and environment IDs are stored locally, and a git remote is created (default name = "catalyze") so that code can be pushed, built, and deployed.

Options:

```
  --remote TEXT  The name of the git remote to be created.
  --help         Show this message and exit.
```
