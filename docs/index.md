## IaC module - Cloudwatch

### Content
- [Creating a log group](#log-group)
- [Creating a metric alarm](#metric-alarm)
- [Creating an event rule](#event-rule)

<a name="log-group"></a>
#### Creating a Log Group

```hcl
module "cloudwatch_log_group" {
  source = "github.com/PROJECT-DILI/DILI-AWS-CLOUDWATCH-IAC?ref=v1.0.0"

  create_log_group = true
  log_group_name   = "/aws/lambda/function_name"
  
  tags = {
     terraform = true
  }
}
```
<a name="metric-alarm"></a>
#### Creating a metric alarm

```hcl
module "health_alarm" {
  source = "github.com/PROJECT-DILI/DILI-AWS-CLOUDWATCH-IAC?ref=v1.0.0"

  create_metric_alarm = true
  alarm_name          = "my_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  datapoints_to_alarm = 1

  dimensions = {
    FunctionName = "function_name"
  }
}
```
<a name="event-rule"></a>
#### Creating an event rule
```hcl
module "cloudwatch_event_lbda_health" {
  source = "github.com/PROJECT-DILI/DILI-AWS-CLOUDWATCH-IAC?ref=v1.0.0"

  create_event              = true
  name_event                = "execute-every-1-minutes"
  description_rule_event    = "Trigger an event every 1 minutes"
  schedule_expression_event = "rate(1 minute)"
}
```
