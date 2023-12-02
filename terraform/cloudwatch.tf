locals {
  json_files = fileset("${path.module}/../cloudwatch", "*.json")
}

output "lcl" {
  value = local.json_files
}

resource "aws_cloudwatch_dashboard" "main" {
  for_each       = local.json_files
  dashboard_name = replace(each.value, ".json", "-terraform")
  dashboard_body = file("${path.module}/../cloudwatch/${each.value}")
}