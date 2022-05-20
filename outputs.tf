output "log_group_arn" {
  description = "The Amazon Resource Name (ARN) specifying the log group"

  value = element(
    concat(
      aws_cloudwatch_log_group.this_no_prefix_no_kms.*.arn,
      aws_cloudwatch_log_group.this_no_kms.*.arn,
      aws_cloudwatch_log_group.this_no_prefix.*.arn,
      aws_cloudwatch_log_group.this.*.arn,
      [""],
    ),
    0,
  )
}

output "event_rule_id" {
  description = "The name of the rule (id) "

  value = element(
    concat(
      aws_cloudwatch_event_rule.this_no_prefix_no_pattern.*.id,
      aws_cloudwatch_event_rule.this_no_pattern.*.id,
      [""],
    ),
    0,
  )
}

output "event_rule_arn" {
  description = "The Amazon Resource Name (ARN) specifying the event rule"

  value = element(
    concat(
      aws_cloudwatch_event_rule.this_no_prefix_no_pattern.*.arn,
      aws_cloudwatch_event_rule.this_no_pattern.*.arn,
      [""],
    ),
    0,
  )
}

output "cloudwatch_metric_alarm_arn" {
  description = "The ARN of the Cloudwatch metric alarm."
  value       = element(concat(aws_cloudwatch_metric_alarm.this.*.arn, [""]), 0)
}

output "cloudwatch_metric_alarm_id" {
  description = "The ID of the Cloudwatch metric alarm."
  value       = element(concat(aws_cloudwatch_metric_alarm.this.*.id, [""]), 0)
}