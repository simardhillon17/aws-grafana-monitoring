data "aws_caller_identity" "current" {}

locals {
  aws_account_id         = data.aws_caller_identity.current.account_id
}
data "aws_eks_cluster" "cluster" {
  name = local.cluster_name
}


module "grafana_policy" {
  source = "git::https://git.git.example.com/scm/cdm/aws-terraform-modules.git//src/iam/iam-policy?ref=main"
  product_name = "${local.product_name}-${local.business_unit}"
  cluster_name = local.cluster_name
  purpose      = local.purpose
  
  policy_statements = [
    { 
      sid    = "AllowReadingMetricsFromCloudWatch"
      effect = "Allow"
      actions = [
       "cloudwatch:DescribeAlarmsForMetric",
       "cloudwatch:DescribeAlarmHistory",
       "cloudwatch:DescribeAlarms",
       "cloudwatch:ListMetrics",
       "cloudwatch:GetMetricStatistics",
       "cloudwatch:GetMetricData",
       "cloudwatch:GetInsightRuleReport",
    ]
      resources = ["*"]
    },
    {
      sid       = "AllowReadingLogsFromCloudWatch"
      effect    = "Allow"
      actions = [
       "logs:DescribeLogGroups",
       "logs:GetLogGroupFields",
       "logs:StartQuery",
       "logs:StopQuery",
       "logs:GetQueryResults",
       "logs:GetLogEvents",
    ]
      resources = ["*"]
    },
    {
      sid       = "AllowReadingTagsInstancesRegionsFromEC2"
      effect    = "Allow"
      actions = [
       "ec2:DescribeTags",
       "ec2:DescribeInstances",
       "ec2:DescribeRegions",
    ]
      resources = ["*"]
    },
    {
      sid       = "AllowReadingResourcesForTags"
      effect    = "Allow"
      actions = ["tag:GetResources"]
      resources = ["*"]
    },
    {
      sid       = "AllowOAMLinkListing"
      effect    = "Allow"
      actions   = [
        "oam:ListSinks",
        "oam:ListAttachedLinks"
      ]
      resources = ["*"]
    }
  ]
}



module "grafana_irsa_role" {
  source     = "git::https://git.git.example.com/scm/cdm/aws-terraform-modules.git//src/iam/iam-assumable-role-with-oidc?ref=main"
  product_name = "${local.product_name}-${local.business_unit}"
  cluster_name = local.cluster_name
  purpose      = local.purpose
  role_policy_arns           = [module.grafana_policy.arn]
  oidc_fully_qualified_subjects  = local.oidc_fully_qualified_subjects
  oidc_fully_qualified_audiences =  ["sts.amazonaws.com"]
  tags = {
    RoleDescription = "Grafana role with IRSA implementation to access cloudwatch"
  }
}

module "commontags" {
  source = "git::https://git.git.example.com/scm/cdm/aws-terraform-modules.git//src/commontags?ref=v5.0.0"
  lifecyle = local.lifecycle
  tier = local.tier
  dataClassification = local.dataClassification
  costcenter = local.costcenter
  service_id = local.service_id
  eol_date = local.eol_date
  department = local.department
  group = local.group
  tech_contact = local.tech_contact
  description = local.description

  providers = {
    aws = aws.common-tags
  }
}