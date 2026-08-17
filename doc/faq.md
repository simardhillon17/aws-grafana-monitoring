# Frequently Asked Questions

- How can I import a dashboard?

From the dashboard menu item, select manage, and then you can use the import functionality.  Product dashboards should be provided via CRD in the product deployment.

- I need a new datasource!

Data sources can be added via the Data Source configuration page.  Datasources should be deployed with a CRD furnished with the data source on deployment.

- How do I make a CRD for a dashboarD?
You just have to include the json inside of the YAML.  See [SimpleDashboard.yaml](https://git.example.aws/projects/cdm/repos/aws-grafana-observability/browse/src/deploy/examples/dashboards/SimpleDashboard.yaml) for example.

