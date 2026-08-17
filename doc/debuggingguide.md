# Debugging Guide
This section contains helpful hints for frustration mitigation. Add to this section over time as experience accumulates.

- This is the operator chart.  When troubleshooting, be sure to check the logs for the operator as well as the grafana deployments.  Verify that the 'vault-secret' init-container is executing correctly.

- To use cloudwatch as datasource make sure IAM role have correct service account names and service accounts are annotated with role arn