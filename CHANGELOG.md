# Changelog

## v3.0.2.dev.1 (2023-12-07)
### Added
- Updated grafana chart and images as below
- Grafana operator chart : `3.5.7-1`
- Grafana-operator image : `5.5.0-debian-11-r0-platform`
- Grafana image: `10.2.2-debian-11-r1-platform`
- Created new DEV tag `v3.0.2.dev.1`
- Creating new QA tag of `v3.0.2.qa.1`
- Creating new UAT tag of `v3.0.2.uat.1`
- Creating new PROD tag of `v3.0.2.1`
- Checkov execption - 
  * read-only filesystem - unable to update grafana.ini file.
  * Service account automount


## v3.0.1.dev.1 (2023-11-08)
### Added
- Updated helm chart registry url to oci
- Updated grafana.ini
- Created new DEV tag `v3.0.1.dev.1`
- Creating new QA tag of `v3.0.1.qa.1`
- Creating new UAT tag of `v3.0.1.uat.1`
- Creating new PROD tag of `v3.0.1.1`

## v3.0.0.dev.7 (2023-09-01)
### Added
- Updated IAM role for cw cross account access.
- Updated grafana.ini
- Created new DEV tag `v3.0.0.dev.7`
- Creating new QA tag of `v3.0.0.qa.7`
- Creating new UAT tag of `v3.0.0.uat.8`
- Creating new PROD tag of `v3.0.0.7`

## v3.0.0.dev.6 (2023-07-20)
### Added
- Updated image for csv plugin

## v3.0.0.dev.5 (2023-07-17)
### Added
- Updated Tshirt sizes for limits and requests.

## v3.0.0.dev.4 (2023-05-24)
### Added
- Updated command arguments in SC Template.

## v3.0.0.dev.3 (2023-05-03)
### Added
- Updated common tags for grafana

## v3.0.0.dev.2 (2023-03-31)
### Added
- Updated grafana image for marcusolsson-json-datasource plugin.
  Grafana image: `9.3.6-debian-11-r0-1-platform`
## v3.0.0.dev.1 (2023-02-14)
### Added
- Upgraded grafana to 9.3.6
- Updated grafana and grafana-operator images to below
  Grafana-operator image : `4.8.0-debian-11-r21`
  Grafana image: `9.3.6-debian-11-r0`
- Bumped Helm chart version to `2.7.16`
- Created new DEV tag `v3.0.0.dev.1`
- Creating new QA tag of `v3.0.0.qa.1`
- Creating new UAT tag of `v3.0.0.uat.1`
- Creating new PROD tag of `v3.0.0.1`

## v2.0.0.dev.2 (2022-11-28)
### Added
- Added node-affinity, tolerations , and labels `iscontrolplane:true` to alerts and PodDisruptionBudget
- Bumped Helm chart version to 2.7.0-4
- Created new DEV tag v2.0.0.dev.2
- Created new UAT tag v2.0.0.uat.6