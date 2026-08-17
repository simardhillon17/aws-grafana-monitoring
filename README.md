# aws-grafana-observability

A reusable observability stack for AWS EKS built around **Grafana**, deployed via
**ArgoCD** and a **Jenkins** pipeline, with a large library of ready-made Grafana
dashboards for Kubernetes, Istio, Prometheus/Thanos, Kafka/MSK, and AWS services.

Grafana runs in a central monitoring cluster and reads metrics/logs for every
account and region it is pointed at (CloudWatch, Prometheus, Thanos).

## What's here

| Path | Contents |
| :--- | :--- |
| `dashboards/` | Grafana dashboards (JSON + Grafana-Operator `GrafanaDashboard` YAML) grouped by domain: infra services, infra tools, streaming, application, and an observability framework. |
| `src/terraform/` | Terraform for the IRSA IAM role/policy that grants Grafana scoped CloudWatch access, plus SSM/config wiring. |
| `Templates/` | ArgoCD / Helm `grafana-custom-resource.yaml` override template. |
| `Jenkinsfile`, `Groovy/`, `deploy.sh`, `upgrade.sh` | CI/CD to build, scan (Prisma Cloud / Twistlock), and deploy the chart. |
| `doc/` | Architecture, deployment, debugging, monitoring, and security guides. |

> **Note:** the upstream Grafana Helm chart and container images (Bitnami) are **not
> vendored** in this repo. The pipeline expects them to be pulled from the upstream
> source at build time (see `Jenkinsfile` / `JenkinsDockerBuildScan` parameters).

## Naming conventions

- **Namespace:** `monitoring`
- **IRSA role purpose:** `cwaccess` → `grafana-{business_unit}-{cluster_name}-cwaccess`
- **Endpoint:** `grafana-{business_unit}.{dns_domain}`

## Deployment prerequisites

- The NGINX ssl-passthrough ingress variant deployed on the cluster (provides the
  `IngressClass` Grafana uses).
- External DNS deployed on the cluster (for service host endpoint creation).
- Sidecar Injector deployed on the cluster.
- Grafana admin credentials stored in Vault:
  `/secret/aws/{account_name}/{region}/grafana/credentials`
- Keycloak client id/secret for Grafana stored in Vault:
  `/secret/aws/{account_name}/{region}/grafana/keycloak-info`
- A Postgres database for Keycloak, with connection details in Vault:
  `/secret/aws/{account_name}/{region}/postgres/keycloak-info`
  (host example: `your-db-host.us-east-1.rds.amazonaws.com:5433`)

## Deployment overview

1. **Terraform** creates the IRSA IAM role/policy for CloudWatch access.
2. The **namespace Jenkins pipeline** integrates service accounts with Vault.
3. The **Grafana Jenkins pipeline** creates the domain-certificate secret.
4. The Helm deployment is applied through **ArgoCD** using the override values in
   `Templates/grafana-custom-resource.yaml`.

## Documentation index

See [`doc/`](./doc/) — architecture, deployment, debugging, monitoring, security,
FAQ, recipes, and use cases.
