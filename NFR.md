# Product Delivery Checklist

## Functional Requirements

| Requirement | Met/Not-Met/NA | Comments |
|---------|---------|---------|
| Service Catalog | Met | Working in devtooling us-west-2 and eu-central-1


## Non-Functional Requirements

### Code Delivery

| Requirement | Met/Not-Met/NA | Comments
|---------|---------|---------|
| Branching Strategy | Met | See design Document under Appendix | TODO
| Release Notes | Met | [Grafana README.md](./README.md)| TODO
| Design Document | Met | [Grafana Design Document](https://docs.example.com/document/d/YOUR_DOC_ID) | TODO
| Architecture Diagrams | Met | [Grafana Design Document](https://docs.example.com/document/d/YOUR_DOC_ID) | TODO


### Service Catalog

| Requirement | Met/Not-Met/NA | Comments |
|---------|---------|---------|
| SC Integration | Met | Tested |
| Service Start | N/A | Not available |
| Service Stop | N/A | Not available |
| Decommission | Met | Tested |

### Testing/Validation

| Requirement | Met/Not-Met/NA | Comments |
|---------|---------|---------|
| Image Scans | Met | HARBOR SCANS [Grafana](https://registry.example.com/harbor/projects/9/repositories/grafana) / [Grafana Operator](https://registry.example.com/harbor/projects/9/repositories/grafana-operator) |
| OPA Scans | Met | [See Macroscope]() TODO |
| Automated Tests | Not-Met | TBD | TODO
| Smoke Tests | Met | Implemented in the Helm Chart  |


### IAM Policies

| Requirement | Met/Not-Met/NA | Comments |
|---------|---------|---------|
| Policies Coded | Met | DT7L-614 - Role for Cloudwatch Visibility |
| Roles Coded | Met | DT7L-614 - Role for Cloudwatch Visibility |
| Certificate Management | NA | Grafana is using nGnix controller SSL configuration |

### Security

| Requirement | Met/Not-Met/NA | Comments |
|---------|---------|---------|
| Enable SSL | Met | Using Platform Vault certificate |
| Enable KMS | NA | Doesnt require KMS integration, using native EKS instance KMS configuration  |
| Vault Integration | Met | Database, Keycloak, and Grafana Admin credentials |
| Parameter Store Integration | NA | Not required, all values supplied through the ArgoCD `override-values.yaml` or Service Catalog|

### Product Support

| Requirement | Met/Not-Met/NA | Comments |
|---------|---------|---------|
| Support Documentation | Met | README.md is still a work in progress, will be updated with further development |
| Auto Scaling | NA | Grafana runs 3x replicas and will rely on EKS Cluster autoscaling configuration |
| Canary or Blue Green deployment | NA | Subject to Argo/SC |
| Externalized/Parameterized configuration | Met | SC Integration accepts parameters. |
| Minimum Platform Tags | Not-Met | TBD |

### Resiliency

| Requirement | Met/Not-Met/NA | Comments |
|---------|---------|---------|
| Multi AZ | Met | Grafana pods deployed with host and az anti-affinity |
| Multi Region | NA | Not a requirement for Grafana |
| Backup and Retention policies | NA | Postgres datastore has automated snapshots |
| RTO Defined | NA | Discussion in progress with Platform about requirements |
| RPO Defined | NA | Discussion in progress with Platform about requirements |
 

### Performance and Scale

| Requirement | Met/Not-Met/NA | Comments |
|---------|---------|---------|
| Auto-Scaling | NA | Met by the cluster |
| Memory based | NA | Met by the cluster |
| CPU based | NA | Met by the cluster |
| Disk I/O based | NA | No  |
| Custom Metrics | NA | No requirements set |

### Logging and Monitoring

| Requirement | Met/Not-Met/NA | Comments |
|---------|---------|---------|
| Cloudwatch Integration | NA | Not required | TODO
| Prometheus Integration | Met | This service is part of the Prometheus stack |
| Grafana Dashboard | Met | Grafana dashboard |

### Access Management

| Requirement | Met/Not-Met/NA | Comments |
|---------|---------|---------|
| Keycloak Integration | Met | Using Keycloak |
| SASL Integration | NA | Using Keycloak |
| IAM Integration | NA | Not required by Grafana |