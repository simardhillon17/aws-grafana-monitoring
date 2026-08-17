provider "aws" {
  region = local.region
  endpoints {
    sts = "https://sts.${local.region}.amazonaws.com"
  }
  default_tags {
    tags = module.commontags.all_tags
  }
}

provider "aws" {
  region = local.region
  alias = "common-tags"
}
