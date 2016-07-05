---
title: Deploy Keys Add
layout: paas_cli
---

## Deploy Keys Add

```
Usage: catalyze deploy-keys add NAME KEY_PATH SERVICE_NAME

Add a new deploy key

Arguments:
  NAME=""           The name for the new key, for your own purposes
  KEY_PATH=""       Relative path to the SSH key file
  SERVICE_NAME=""   The name of the code service to add this deploy key to
```

`deploy-keys add` allows you to upload an SSH public key in OpenSSH format. These keys are used for pushing code to your code services but are not required. You should be using personal SSH keys with the [keys](#keys) command unless you are pushing code from Continuous Integration or Continuous Deployment scenarios. Deploy keys are intended to be shared among an organization. Here are some sample commands

```
catalyze deploy-keys add app01_public ~/.ssh/app01_rsa.pub app01
```
