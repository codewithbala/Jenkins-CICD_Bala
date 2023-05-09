# variable "jenkins_admin_user" {
#   description = "The admin username for Jenkins"
#   default     = "admin"
# }

# variable "jenkins_admin_password" {
#   description = "The admin password for Jenkins"
#   default     = "Admin@456"
# }

resource "aws_security_group" "allow_SSH_ubuntu" {
  name        = "allow_SSH_ubuntu"
  description = "Allow SSH inbound traffic"
  #   vpc_id      = aws_vpc.main.id


  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDD8gTEP0wdqJnHkVDc7IMzFygpsibTemZylZvk4gcGiaa+YX8/VpUEyOrqYOg/8OrOAsdQCpPcc8J3AhUBSvgjeKc7sJZ0N8v+AOKnVQDni/y+9mWD6oGOszzH6DVfoHOy1HRZAbF6n+xFkk0DeisSJ3FsGVQK/J5rYgXVCBJii34mL0+DOBogxLva8tDcLgWLz+qxs8QcH4hgrHkdT8whBKfKcypICGS4U/WgXFW5M3pN4OynSzeqJ9gXn0Fbq50J/t6Cpnr6wqlzRzocAMXnlgrchYZWZJgTL3W8zrg1Fx7RBy3fAbEyWoyrkB9cFIPSkmiUZG9xUhirI4MbdgHVNlkp7xU0V6KfCRlTNE+xzWlbPSga7kjlqiizjDoR7xExKNLbNthB6nlNIEwX+FljtgrTqMV2w6k8H3xfrhdG0993EnMMwdPVmltEjJeZ+l3BETUcibKGFFc5iyR99W7NKhriH5d6OvbXev7JmbqsXrwn8rnu3auDGJs7YaIwzmk= varunmanikoutlo@ip-172-31-17-206"
}

####### Ubuntu VM #####


resource "aws_instance" "ubuntu" {
  ami                    = "ami-007855ac798b5175e"
  instance_type          = "t2.medium"
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_SSH_ubuntu.id}"]
  tags = {
    "Name" = "Jenkins-UBUNTU-22-04"
    "ENV"  = "Dev"
  }
  # metadata_options {
  #   http_endpoint = "disabled"
  # }
  # Type of connection to be established
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./deployer")
    host        = self.public_ip
    timeout     = "10m"
  }

    associate_public_ip_address = true

  # Remotely execute commands to install Java, Python, Jenkins
  provisioner "remote-exec" {
    inline = [
      "sudo apt update ",
      "sudo apt install -y default-jdk ",
      "sudo mkdir -p /usr/share/keyrings/",
      "sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null",
      "sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null",
      "sudo apt update",
      "sudo apt install -y jenkins",
      "sudo systemctl start jenkins --no-pager -l",
      "sudo systemctl enable --now jenkins",
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword",
    ]
  }

  depends_on = [aws_key_pair.deployer]

}

output "ubuntu" {
  value       = aws_instance.ubuntu.public_ip
  description = "description"
}
