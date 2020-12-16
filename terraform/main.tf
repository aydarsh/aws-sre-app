# Create a database server
resource "aws_db_instance" "db" {
  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  name              = "dbhello"
  username          = "rootuser"
  password          = "rootpasswd"
}
