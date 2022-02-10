resource "aws_instance" "webserver" {
  ami                         = var.image_id
  instance_type               = var.instance_type
  user_data                   = file("webserver.sh")
  subnet_id                   = aws_subnet.public_1a.id
  vpc_security_group_ids      = ["${aws_security_group.http.id}"]
  associate_public_ip_address = true
  key_name                    = var.key_name



  tags = {
    Name = "webserver"
  }
}

resource "aws_instance" "webserver2" {
  ami                         = var.image_id
  instance_type               = var.instance_type
  user_data                   = file("webserver.sh")
  subnet_id                   = aws_subnet.public_1a.id
  vpc_security_group_ids      = ["${aws_security_group.http.id}"]
  associate_public_ip_address = true
  key_name                    = var.key_name


  tags = {
    Name = "webserver2"
  }
}

resource "aws_instance" "phpmyadmin" {
  ami                         = var.image_id
  instance_type               = var.instance_type
  user_data                   = file("phpmyadmin.sh")
  subnet_id                   = aws_subnet.public_1b.id
  vpc_security_group_ids      = ["${aws_security_group.http.id}"]
  associate_public_ip_address = true
  key_name                    = var.key_name


  tags = {
    Name = "phpmyadmin"
  }
}
