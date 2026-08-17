// Create SSM Parameter Containing the Grafana SC Provisoned Product ID
resource "aws_ssm_parameter" "grafana_endopint" {
  name  = "/application/ops/${local.region}/grafana/endpoint"
  type  = "String"
 # value = local.endpoint
  value =  "https://${local.endpoint}"
}
