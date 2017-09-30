resource "aws_iam_role" "rds_enhanced_monitoring" {
  name               = "rds-enhanced_monitoring-role"
  assume_role_policy = "${data.aws_iam_policy_document.rds_enhanced_monitoring.json}"
}

resource "aws_iam_role_policy_attachment" "rds_enhanced_monitoring" {
  role       = "${aws_iam_role.rds_enhanced_monitoring.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

data "aws_iam_policy_document" "rds_enhanced_monitoring" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}

module "db" {
  source = "../../"

  # rest of params here as per complete example

  monitoring_interval = "${var.monitoring_interval}"
  monitoring_role_arn = "${aws_iam_role.rds_enhanced_monitoring.arn}"
}
