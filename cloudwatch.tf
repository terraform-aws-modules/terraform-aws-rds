resource "aws_cloudwatch_metric_alarm" "alarm_CPUUtilization" {
  alarm_name = "tf-${terraform.env}-${var.rds_name}-rds-alarm-CPUUtilization"

  dimensions {
    DBInstanceIdentifier = "${var.rds_name}"
  }

  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "5"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/RDS"
  period                    = "${var.period}"
  statistic                 = "Maximum"
  threshold                 = "90"
  alarm_description         = "High CPUUtilization on ${terraform.env} ${var.rds_name}"
  alarm_actions             = ["${var.sns}"]
  ok_actions                = ["${var.sns}"]
  insufficient_data_actions = []
}

resource "aws_cloudwatch_metric_alarm" "alarm_FreeStorageSpace" {
  alarm_name = "tf-${terraform.env}-${var.rds_name}-rds-alarm-FreeStorageSpace"

  dimensions {
    DBInstanceIdentifier = "${var.rds_name}"
  }

  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "5"
  metric_name               = "FreeStorageSpace"
  namespace                 = "AWS/RDS"
  period                    = "${var.period}"
  statistic                 = "Maximum"
  threshold                 = "500000000"
  alarm_description         = "Low FreeStorageSpace on ${terraform.env} ${var.rds_name}"
  alarm_actions             = ["${var.sns}"]
  ok_actions                = ["${var.sns}"]
  insufficient_data_actions = []
}

resource "aws_cloudwatch_metric_alarm" "alarm_FreeableMemory" {
  alarm_name = "tf-${terraform.env}-${var.rds_name}-rds-alarm-FreeableMemory"

  dimensions {
    DBInstanceIdentifier = "${var.rds_name}"
  }

  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "5"
  metric_name               = "FreeableMemory"
  namespace                 = "AWS/RDS"
  period                    = "${var.period}"
  statistic                 = "Maximum"
  threshold                 = "200000000"
  alarm_description         = "Low FreeableMemory on ${terraform.env} ${var.rds_name}"
  alarm_actions             = ["${var.sns}"]
  ok_actions                = ["${var.sns}"]
  insufficient_data_actions = []
}
