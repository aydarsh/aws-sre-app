# Create a database server
resource "aws_db_instance" "db" {
  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  name              = "dbhello"
  username          = "rootuser"
  password          = "${var.DBPASSWORD}"
}

resource "null_resource" "execute-sql" {
  depends_on = [aws_db_instance.db, local_file.sql-statement]
  provisioner "local-exec" {
    command = "mysql --version"
  }
}

resource "local_file" "sql-statement" {
  content = file("../hello_world.sql")
  filename          = "hello_world.sql"
}