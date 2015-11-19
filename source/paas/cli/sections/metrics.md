---
title: Metrics
layout: paas_guides
---

# Metrics

```
Usage: catalyze metrics [SERVICE_NAME] [(--json | --csv | --spark)] [--stream] [-m]

Print service and environment metrics in your local time zone

Arguments:
  SERVICE_NAME=""   The name of the service to print metrics for

Options:
  --json=false     Output the data as json
  --csv=false      Output the data as csv
  --spark=false    Output the data using spark lines
  --stream=false   Repeat calls once per minute until this process is interrupted.
  -m, --mins=1     How many minutes worth of logs to retrieve.
```

`metrics` prints out various metrics for your environment or individual service. Metrics included are CPU metrics, Memory metrics, Disk I/O metrics, and Network metrics. You can print out metrics in csv, json, plain text, or spark lines format. If you want plain text format, simply omit the json, csv, and spark options. You can only stream metrics using plain text or spark lines formats. To print out metrics for every service in your environment, omit the `SERVICE_NAME` argument. Otherwise you may choose a service, such as an app service, to retrieve metrics for. Here are some sample commands

```
catalyze metrics
catalyze metrics app01 --stream
catalyze metrics --json
catalyze metrics db01 --csv -m 60
```
