
##security group for frontend application which is wordpress in our case and using launch configuration and autoscaling to start it.

resource "aws_security_group" "wordpress" {
  name_prefix = "wordpress"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
}
}




##security group for backend database which is RDS in our case

resource "aws_security_group" "wordpress_db" {
  name_prefix = "wordpress-db"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = ["${aws_security_group.wordpress.id}"]
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    security_groups = ["${aws_security_group.wordpress.id}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    security_groups = ["${aws_security_group.wordpress.id}"]
}
depends_on = [aws_security_group.wordpress]
}
