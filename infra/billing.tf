resource "aws_sns_topic" "billing_alerts" {
  provider = aws.us_east_1
  name     = "${var.project}-billing-alerts"
}

resource "aws_sns_topic_subscription" "billing_email" {
  provider  = aws.us_east_1
  topic_arn = aws_sns_topic.billing_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

resource "aws_cloudwatch_metric_alarm" "billing_1_dollar" {
  provider            = aws.us_east_1
  alarm_name          = "${var.project}-billing-1-dollar"
  alarm_description   = "Billing exceeded $1"
  namespace           = "AWS/Billing"
  metric_name         = "EstimatedCharges"
  statistic           = "Maximum"
  period              = 86400
  evaluation_periods  = 1
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_actions       = [aws_sns_topic.billing_alerts.arn]

  dimensions = {
    Currency = "USD"
  }
}

resource "aws_cloudwatch_metric_alarm" "billing_5_dollar" {
  provider            = aws.us_east_1
  alarm_name          = "${var.project}-billing-5-dollar"
  alarm_description   = "Billing exceeded $5"
  namespace           = "AWS/Billing"
  metric_name         = "EstimatedCharges"
  statistic           = "Maximum"
  period              = 86400
  evaluation_periods  = 1
  threshold           = 5
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_actions       = [aws_sns_topic.billing_alerts.arn]

  dimensions = {
    Currency = "USD"
  }
}

resource "aws_cloudwatch_metric_alarm" "billing_10_dollar" {
  provider            = aws.us_east_1
  alarm_name          = "${var.project}-billing-10-dollar"
  alarm_description   = "Billing exceeded $10 — investigate immediately"
  namespace           = "AWS/Billing"
  metric_name         = "EstimatedCharges"
  statistic           = "Maximum"
  period              = 86400
  evaluation_periods  = 1
  threshold           = 10
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_actions       = [aws_sns_topic.billing_alerts.arn]

  dimensions = {
    Currency = "USD"
  }
}