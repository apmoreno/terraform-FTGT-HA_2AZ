# Add RDP access to Main security group

resource "aws_security_group_rule" "allow_RDP" {
  type            = "ingress"
  from_port       = 3389
  to_port         = 3389
  protocol        = "rdp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = 0.0.0.0/0

  security_group_id = "sg-123456"
}
#need to identify the id of the main SG
Group Name = default

data "aws_security_groups" "test" {
  tags = {
    Application = "k8s"
    Environment = "dev"
  }
}

tag :key- The key/value combination of a tag assigned to the resource. Use the tag key in the filter name and the tag value as the filter value. For example, to find all resources that have a tag with the key Owner and the value TeamA , specify tag:Owner for the filter name and TeamA for the filter value.
tag-key - The key of a tag assigned to the resource. Use this filter to find all resources assigned a tag with a specific key, regardless of the tag value.

Get SG id from EC2: https://www.terraform.io/docs/providers/aws/d/instance.html 