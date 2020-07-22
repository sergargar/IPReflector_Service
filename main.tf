provider "aws" {
  profile    = "default"
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_key_pair" "instance" {
  key_name   = "flaskKey"
  public_key = file("~/.ssh/flaskKey.pem.pub")
}

resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "IPReflector-lc"
  image_id      = "ami-0cb2167f028843285"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.instance.id}"]
  lifecycle {
    create_before_destroy = true
  }
  key_name = aws_key_pair.instance.id
  user_data = "${file("gunicorn.sh")}"
}

resource "aws_autoscaling_group" "flask" {
  name                 = "IPReflector-asg"
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  min_size             = 3
  max_size             = 5
  availability_zones   = ["us-east-1a"]

  lifecycle {
    create_before_destroy = true
  }
}


