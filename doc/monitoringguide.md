# Monitoring Guide
This section contains information on how this service should be monitored.

## Metrics:

Enable service monitor to get metrics scrapped by prometheus

Grafana-Operator service monitor

```
      port: 8080
      path: /metrics
```
Grafana Service monitor

```
      port: 3000
      path: /metrics
      
```


## Alert Rules are based on following metrics with prometheus operator:

```
alert: GrafanaNotReady
expr: kube_pod_container_status_ready{container="grafana"} == 0

alert: AllGrafanaNotReady
expr: count(kube_pod_container_status_ready{container="grafana"} == 1) == 0

alert: GrafanaOperatorNotReady
expr: kube_pod_container_status_ready{container="grafana-operator"} == 0

alert: GrafanaOperatorReconcileErrors
expr: increase(controller_runtime_reconcile_errors_total{container="grafana-operator"}[10m]) > 1

alert: GrafanaOperatorCertificateReadErrors
expr: increase(certwatcher_read_certificate_errors_total{container="grafana-operator"}[10m]) > 1

alert: Grafana400Errors
expr: increase(grafana_page_response_status_total{job="grafana-service",code=~"4.*"}[5m]) > 1

alert: Grafana500Errors
expr: increase(grafana_page_response_status_total{job="grafana-service",code=~"4.*"}[5m]) > 1

alert: GrafanaOperator400Errors
expr: increase(grafana_page_response_status_total{job="grafana-service",code=~"4.*"}[5m]) > 1

alert: GrafanaOperator500Errors
expr: increase(grafana_page_response_status_total{job="grafana-service",code=~"4.*"}[5m]) > 1

```


## Grafana Dashboard :

[Grafana Dashboard Json](../dashboards/grafana1.json)
[Grafana-Operator Dashboard Json](../dashboards/grafana-operator.json)
