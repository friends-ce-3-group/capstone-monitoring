locals {
  json_files = fileset(path.module, "cloudwatch/*.json")
}
resource "aws_cloudwatch_dashboard" "main" {
  for_each       = local.json_files
  dashboard_name = replace(replace(each.value, ".json", "-terraform"), "cloudwatch/", "")
  dashboard_body = file("${path.module}/${each.value}")
}