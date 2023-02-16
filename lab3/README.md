## Infrastructure as Code (IaC) using Terraform and ansible integration with slack

## diagram 
![image](pics/../pics/ansible.jpg)

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


