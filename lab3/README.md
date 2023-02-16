## Infrastructure as Code (IaC) using Terraform and ansible integration with slack
1.Dynamically create an inventory: Use the Terraform state file to generate a dynamic     
  inventory file that can be used by Ansible. This eliminates the need to manually create and manage inventory files, making the process more efficient and less error-prone.

2.Integrate with Slack: Set up Slack notifications to get notified of any infrastructure    
  successful installation with ansible

## diagram 
![image](pics/ansible.jpg)


## Requirements
1. terraform
2. ansible 
3. slack account


## result
![image](pics/nexus.png)
![image](pics/nexus1.png)
![image](pics/sonarqube.png)
![image](pics/slack1.png)
![image](pics/slack2.png)
![image](pics/slack3.png)


## tree
```
../lab3
├── alb.tf
├── ansible-1.pem
├── ec2.tf
├── inventory.txt
├── networks.tf
├── pics
│   ├── ansible.jpg
│   ├── nexus1.png
│   ├── nexus.png
│   ├── slack1.png
│   ├── slack2.png
│   ├── slack3.png
│   └── sonarqube.png
├── playbook.yml
├── privoder.tf
├── README.md
├── roles
│   ├── Nexus
│   │   ├── defaults
│   │   │   └── main.yml
│   │   ├── files
│   │   │   └── nexus.service
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── meta
│   │   │   └── main.yml
│   │   ├── README.md
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── Nginx
│   │   ├── defaults
│   │   │   └── main.yml
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── meta
│   │   │   └── main.yml
│   │   ├── README.md
│   │   ├── tasks
│   │   │   ├── default
│   │   │   └── main.yml
│   │   ├── tests
│   │   │   ├── inventory
│   │   │   └── test.yml
│   │   └── vars
│   │       └── main.yml
│   └── sonarqube-role
│       ├── defaults
│       │   └── main.yml
│       ├── handlers
│       │   └── main.yml
│       ├── meta
│       │   └── main.yml
│       ├── README.md
│       ├── tasks
│       │   ├── main.yml
│       │   ├── sonar.properties
│       │   └── sonar.service
│       ├── tests
│       │   ├── inventory
│       │   └── test.yml
│       └── vars
│           └── main.yml
├── scripts
│   ├── bash.sh
│   └── fish.sh
├── security_groups.tf
├── terraform.tfstate
└── terraform.tfstate.backup
```


