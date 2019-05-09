data "template_file" "user_data" {
  template = "${file("user-data.sh")}"
  vars {
    domain = "${var.domain}"
    email  = "${var.email}"
    name   = "${var.name}"
  }
}
resource "aws_instance" "iam" {
  ami                         = "${var.ami}"
  associate_public_ip_address = true
  instance_type               = "${var.instance_type}"
  key_name                    = "${aws_key_pair.ssh_key.key_name}"
  security_groups             = ["${aws_security_group.iam.name}"]
  user_data                   = "${data.template_file.user_data.rendered}"
  root_block_device           = {
    volume_type = "gp2"
    volume_size = "${var.volume_size}"
  }
  tags {
    Name = "${var.name}"
  }
}
resource "aws_eip" "iam" {
  instance = "${aws_instance.iam.id}"
  vpc      = true
  tags {
    Name = "${var.name}"
  }
}
