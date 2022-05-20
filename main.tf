locals {
  tags = {
    Terraform = true
  }
}

resource "aws_cloudwatch_log_group" "this_no_prefix_no_kms" {
  count             = var.create_log_group && var.log_group_name != "" && var.log_group_name_prefix == "" && var.log_group_kms_key_id == "" ? 1 : 0
  name              = var.log_group_name
  retention_in_days = var.log_group_retention_in_days

  tags = merge(
    var.log_group_tags,
    var.tags,
    local.tags,
  )
}

resource "aws_cloudwatch_log_group" "this_no_kms" {
  count             = var.create_log_group && var.log_group_name_prefix != "" && var.log_group_kms_key_id == "" ? 1 : 0
  name_prefix       = var.log_group_name_prefix
  retention_in_days = var.log_group_retention_in_days

  tags = merge(
    var.log_group_tags,
    var.tags,
    local.tags,
  )
}

resource "aws_cloudwatch_log_group" "this_no_prefix" {
  count             = var.create_log_group && var.log_group_name_prefix == "" && var.log_group_kms_key_id != "" ? 1 : 0
  name              = var.log_group_name
  retention_in_days = var.log_group_retention_in_days
  kms_key_id        = var.log_group_kms_key_id

  tags = merge(
    var.log_group_tags,
    var.tags,
    local.tags,
  )
}

resource "aws_cloudwatch_log_group" "this" {
  count             = var.create_log_group && var.log_group_name_prefix != "" && var.log_group_kms_key_id != "" ? 1 : 0
  name_prefix       = var.log_group_name_prefix
  retention_in_days = var.log_group_retention_in_days
  kms_key_id        = var.log_group_kms_key_id

  tags = merge(
    var.log_group_tags,
    var.tags,
    local.tags,
  )
}

resource "aws_cloudwatch_event_rule" "this_no_prefix_no_pattern" {
  count               = var.create_event && var.name_prefix_event == "" && var.schedule_expression_event != "" ? 1 : 0
  name                = var.name_event
  description         = var.description_rule_event
  is_enabled          = var.is_enabled_event
  schedule_expression = var.schedule_expression_event

  tags = merge(
    var.tags,
    local.tags,
  )
}

resource "aws_cloudwatch_event_rule" "this_no_pattern" {
  count               = var.create_event && var.name_prefix_event != "" && var.schedule_expression_event != "" ? 1 : 0
  name_prefix         = var.name_prefix_event
  description         = var.description_rule_event
  is_enabled          = var.is_enabled_event
  schedule_expression = var.schedule_expression_event

  tags = merge(
    var.tags,
    local.tags,
  )
}

resource "aws_cloudwatch_event_target" "this" {
  count = length(var.target_arns) > 0 ? length(var.target_arns) : 0

  rule = element(
    concat(
      aws_cloudwatch_event_rule.this_no_prefix_no_pattern.*.name,
      aws_cloudwatch_event_rule.this_no_pattern.*.name,
      [""],
    ),
    0,
  )

  arn = var.target_arns[count.index]
}

resource "aws_cloudwatch_metric_alarm" "this" {
  count                                 = var.create_metric_alarm && var.alarm_name != "" ? 1 : 0
  alarm_name                            = var.alarm_name
  alarm_description                     = var.alarm_description
  actions_enabled                       = var.actions_enabled
  alarm_actions                         = var.alarm_actions
  ok_actions                            = var.ok_actions
  insufficient_data_actions             = var.insufficient_data_actions
  comparison_operator                   = var.comparison_operator
  evaluation_periods                    = var.evaluation_periods
  threshold                             = var.threshold
  unit                                  = var.unit
  datapoints_to_alarm                   = var.datapoints_to_alarm
  treat_missing_data                    = var.treat_missing_data
  evaluate_low_sample_count_percentiles = var.evaluate_low_sample_count_percentiles
  metric_name                           = var.metric_name
  namespace                             = var.namespace
  period                                = var.period
  statistic                             = var.statistic
  extended_statistic                    = var.extended_statistic
  dimensions                            = var.dimensions

  dynamic "metric_query" {
    for_each = var.metric_query
    content {
      id          = lookup(metric_query.value, "id")
      label       = lookup(metric_query.value, "label", null)
      return_data = lookup(metric_query.value, "return_data", null)
      expression  = lookup(metric_query.value, "expression", null)

      dynamic "metric" {
        for_each = lookup(metric_query.value, "metric", [])
        content {
          metric_name = lookup(metric.value, "metric_name")
          namespace   = lookup(metric.value, "namespace")
          period      = lookup(metric.value, "period")
          stat        = lookup(metric.value, "stat")
          unit        = lookup(metric.value, "unit", null)
          dimensions  = lookup(metric.value, "dimensions", null)
        }
      }
    }
  }

  tags = var.tags
}
