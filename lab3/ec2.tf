resource "aws_instance" "public_ec2" {
  ami           = "ami-09cd747c78a9add63"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public-subnet.id
  key_name = aws_key_pair.mykeypair.key_name
  security_groups = [
    aws_security_group.sg-01.id
  ]

  tags = {
    Name = "public ec2"

  }
}

resource "aws_instance" "public_ec2-1" {
  ami           = "ami-09cd747c78a9add63"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public-subnet-1.id
  key_name = aws_key_pair.mykeypair.key_name
  security_groups = [
    aws_security_group.sg-01.id
  ]

  tags = {
    Name = "public ec2 1"

  }  
}
resource "aws_instance" "private_ec2" {
  ami           = "ami-09cd747c78a9add63"
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.private-subnet.id
  key_name = aws_key_pair.mykeypair.key_name
  security_groups = [
    aws_security_group.sg-02.id
  ]
  
  tags = {
    Name = "Nexus"

  }
}
resource "aws_instance" "private_ec2_1" {
  ami           = "ami-09cd747c78a9add63"
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.private-subnet-1.id
  key_name = aws_key_pair.mykeypair.key_name
  security_groups = [
    aws_security_group.sg-02.id
  ]
  
  tags = {
    Name = "Sonarqube"

  }
}

output "public_ip_for_public_ec2" {
  value = aws_instance.public_ec2.public_ip
}

output "private_ip_for_public_ec2" {
  value = aws_instance.public_ec2.private_ip

}

output "private_ip_for_private_1" {
  value = aws_instance.private_ec2.private_ip

}

output "private_ip_for_private_2" {
  value = aws_instance.private_ec2_1.private_ip

}


resource "aws_key_pair" "mykeypair" {
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvtb6EGHmhGZ6Kd8Rv88UppvIQ9LpbtwF3RJToOUK1FFU2hs9nTq0SKDnhNewlUt2zXVVWtreS7gMUWNDccEV2iQnaaO4nIbxDGHjNK6C2cgiernOrgg7sHKkOrdIf7xDQHp3r78h6hsGRvyJbHSuXT2l48+Kmlt1PGdwOwA/A6On74hpUDq1C/O6gnfsEHyb+OBptGACbQgDqegqEp/nUzLT84omOf/aWooOJnaIvckw5bTFmUFVsQZkuSY/5iVYi4tKJkPloS3Pd/QkW9zeJ8vVddOVZt1Hoa1z6eVMk3VDuVgpv+kEwrNF5PXS3u0KOeFzFR7IW4Qbzkl6g5WFz ansible-1"
 
}

# Generate inventory file
resource "local_file" "inventory" {
    filename = "./inventory.txt"
    content = <<EOF
[public]
nginx1     ansible_host=${aws_instance.public_ec2.public_ip}  ansible_port=22 ansible_user=ubuntu  
nginx2     ansible_host=${aws_instance.public_ec2-1.public_ip}  ansible_port=22 ansible_user=ubuntu      
[private]
nexus       ansible_host=${aws_instance.private_ec2.private_ip}
sonarqube   ansible_host=${aws_instance.private_ec2_1.private_ip} 
[private:vars]
ansible_port = 22
ansible_user = ubuntu 
ansible_ssh_common_args="-o ProxyCommand=\"ssh -q ubuntu@${aws_instance.public_ec2.public_ip}  -o IdentityFile=./ansible-1.pem -o Port=22 -W %h:%p\""
EOF
}

resource "local_file" "nginx" {
    filename = "roles/Nginx/tasks/default"
    content = <<EOF

server {
	  listen 80  ;#default_server;
	  listen [::]:80  ;#default_server;


	  root /var/www/file1;

    #index file1 ahmed.html index.html index.htm index.nginx-debian.html;

	  #server_name _;

	  location / {
	  #	try_files $uri $uri/ =404;
		proxy_pass http://${aws_lb.alb.dns_name};
    }
  }  
EOF
	}    
  
