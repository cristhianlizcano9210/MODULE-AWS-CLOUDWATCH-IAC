variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "create_log_group" {
  description = "Whether to create an AWS CloudWatch log group"
  type        = bool
  default     = true
}

variable "log_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = ""
}

variable "log_group_kms_key_id" {
  description = "The ARN of the KMS Key to use when encrypting log data"
  type        = string
  default     = ""
}

variable "log_group_name" {
  description = "The name of the log group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = ""
}

variable "log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group"
  type        = number
  default     = 1827
}

variable "log_group_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "create_event" {
  description = "Whether to create an AWS CloudWatch event rule"
  type        = bool
  default     = true
}

variable "name_event" {
  description = "The name of the rule. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = ""
}

variable "name_prefix_event" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = ""
}

variable "schedule_expression_event" {
  description = "The scheduling expression"
  type        = string
  default     = ""
}

variable "description_rule_event" {
  description = "The description of the rule"
  type        = string
  default     = ""
}

variable "is_enabled_event" {
  description = "Whether the rule should be enabled"
  type        = bool
  default     = true
}

variable "target_arns" {
  description = "The Amazon Resource Names (ARNs) associated of the target"
  type        = list(string)
  default     = []
}

variable "create_metric_alarm" {
  description = "Whether to create the cloudwatch metric alarm"
  type        = bool
  default     = false
}
variable "alarm_name" {
  description = "The descriptive name for the alarm. This name must be unique within the user's AWS account"
  type        = string
  default     = ""
}

variable "alarm_description" {
  description = "The descriptive for the alarm"
  type        = string
  default     = null
}
variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Static and Threshold"
  type        = string
  default     = null
}

variable "evaluation_periods" {
  description = "The number of periods over wich data us compared to the specified threshold"
  type        = number
  default     = null
}

variable "threshold" {
  description = "The value against which the specified statics is compared"
  type        = number
  default     = null
}

variable "unit" {
  description = "The unit for the alarm's associated metric"
  type        = string
  default     = null
}

variable "metric_name" {
  description = "The name for the alamr's associated metric"
  type        = string
  default     = null
}

variable "namespace" {
  description = "The namespace for the alarm's associated metric."
  type        = string
  default     = null
}

variable "period" {
  description = "The period in seconds over which the specified sttistic is applied"
  type        = string
  default     = null
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
  default     = null
}

variable "actions_enabled" {
  description = "Indicate whether or not actions should be executed during any changes to the alarm's state. defaults to true"
  type        = bool
  default     = true
}

variable "datapoints_to_alarm" {
  description = "The number of datapoints that must be breaching to trigger the alarm."
  type        = number
  default     = null
}

variable "dimensions" {
  description = "The dimensions for the alarm's associated metric"
  type        = any
  default     = null
}

variable "alarm_actions" {
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)"
  type        = list(string)
  default     = null
}

variable "extended_statistic" {
  description = "The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100."
  type        = string
  default     = null
}

variable "insufficient_data_actions" {
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN)"
  type        = list(string)
  default     = null
}

variable "ok_actions" {
  description = "The list actions to execute when list alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN)"
  type        = list(string)
  default     = null
}

variable "treat_missing_data" {
  description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching"
  type        = string
  default     = "missing"
}

variable "evaluate_low_sample_count_percentiles" {
  description = "Used only alarms based on porcentiles. If you specify ignore, the alarm state will not change during periods with too few points to be statistically significant. If you evaluate or omit this parameter, the alarm will always be evaluated and possiblñy change state no matter how many data points are available. The following values are supported: ignore, and evaluate"
  type        = string
  default     = null
}

variable "metric_query" {
  description = "Enables you to create an alarm based on a metric math expression. You may specify at most 20"
  type        = any
  default     = []
}
