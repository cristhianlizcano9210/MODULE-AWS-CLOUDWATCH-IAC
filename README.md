# DILI-AWS-CLOUDWATCH-IAC
Terraform module for AWS CloudWatch.

## Terraform versions

In current version of this module, it works with `Terraform versions >= v1.0.0`

## Documentation
To see all the module documentation, do click [here](https://aws-cloudwatch-iac.github.example.com/).
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create_log_group | Whether to create an AWS CloudWatch log group | bool | `true` | no |
| log_group_name_prefix | Creates a unique name beginning with the specified prefix. Conflicts with name | string | `""` | no |
| log_group_kms_key_id | The ARN of the KMS Key to use when encrypting log data | string | `""` | no |
| log_group_name | The name of the log group. If omitted, Terraform will assign a random, unique name | string | `""` | no |
| log_group_retention_in_days | Specifies the number of days you want to retain log events in the specified log group | number | `1827` | no |
| log_group_tags | A mapping of tags to assign to the resource | map(string) | `{}` | no |
| create_event | Whether to create an AWS CloudWatch event rule | bool | `true` | no |
| name_event | The name of the rule. If omitted, Terraform will assign a random, unique name | string | `""` | no |
| name_prefix_event | Creates a unique name beginning with the specified prefix | string | `""` | no |
| schedule_expression_event | The scheduling expression | string | `""` | yes |
| description_rule_event | The description of the rule | string | `""` | no |
| is_enabled_event | Whether the rule should be enabled | bool | `""` | no |
| target_arns | The Amazon Resource Names (ARNs) associated of the target | list(string) | `[]` | no |
| create_metric_alarm | Whether to create the cloudwatch metric alarm | bool | `false` | no |
| alarm_name | The descriptive name for the alarm | string |`n/a` | yes |
| alarm_description | The descriptive name for the alarm | string | `null` | no |
| comparison_operator | The arithmetic operation to use when comparing the specified Static and Threshold | string | `n/a` | yes |
| evaluation_periods | The number of periods over wich data us compared to the specified threshold | number | `n/a` | yes |
| threshold | The value against which the specified statics is compared | number | `n/a` | yes |
| unit | The unit for the alarm's associated metric | string | `null` | no |
| metric_name | The name for the alamr's associated metric | string | `null` | no |
| namespace | The namespace for the alarm's associated metric | string | `null` | no |
| period | The period in seconds over which the specified sttistic is applied | string | `null` | no |
| statistic | The statistic to apply to the alarm's associated metric | string | `null` | no |
| actions_enabled | Indicate whether or not actions should be executed during any changes to the alarm's state | bool | `true` | no |
| datapoints_to_alarm | The number of datapoints that must be breaching to trigger the alarm | number | `null` | no |
| dimensions | The dimensions for the alarm's associated metric | any | `null` | no |
| alarm_actions | The list of actions to execute when this alarm transitions into an ALARM state from any other state | list(string) | `null` | no |
| extended_statistic | The percentile statistic for the metric associated with the alarm | string | `null` | no |
| insufficient_data_actions | The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state | list(string) | `null` | no |
| ok_actions | The list actions to execute when list alarm transitions into an OK state from any other state | list(string) | `null` | no |
| treat_missing_data | Sets how this alarm is to handle missing data points | string | `missing` | no |
| evaluate_low_sample_count_percentiles | Used only alarms based on porcentiles. If you specify ignore, the alarm state will not change during periods with too few points to be statistically significant | string | `null` | no |
| metric_query | Enables you to create an alarm based on a metric math expression. You may specify at most 20 | any | `[]` | no |
| tags | A mapping of tags to assign to the resource | map(string) | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| log_group_arn | The Amazon Resource Name (ARN) specifying the log group |
| event_rule_id | The name of the rule (id) |
| event_rule_arn | The Amazon Resource Name (ARN) specifying the event rule |
| cloudwatch_metric_alarm_arn | The ARN of the Cloudwatch metric alarm |
| cloudwatch_metric_alarm_id | The ID of the Cloudwatch metric alarm |