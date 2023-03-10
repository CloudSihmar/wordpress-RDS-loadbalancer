
resource "aws_db_instance" "wordpress_db" {
  allocated_storage    = var.db-storage
  engine               = var.db-engine
  engine_version       = var.db-version
  instance_class       = var.db-type
  name                 = "${var.db_name}"
  username             = "${var.db_username}"
  password             = "${var.db_password}"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = ["${aws_security_group.wordpress_db.id}"]
  tags = {
    Name = "wordpress-db"
  }
depends_on = [aws_security_group.wordpress_db]
}

