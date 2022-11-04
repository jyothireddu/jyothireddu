
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "Linux" {
  ami_name      = "packer${local.timestamp}"
  instance_type = "t2.micro"
  region        = "us-west-2"
  source_ami    = "ami-0d593311db5abb72b"
  ssh_username  = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.Linux"]
}
