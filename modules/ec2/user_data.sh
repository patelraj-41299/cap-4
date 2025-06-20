#!/bin/bash
yum update -y
yum install -y docker git ruby wget

# Start Docker
systemctl start docker
systemctl enable docker

# Install CodeDeploy Agent
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
./install auto
systemctl start codedeploy-agent
systemctl enable codedeploy-agent

# Deploy Stylish WebApp
git clone https://github.com/patelraj-41299/cap-4.git
cd cap-4/app/frontend/stylish-1.0.0

# Create Dockerfile
cat <<EOF > Dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
EOF

docker build -t stylish-app .
docker run -d -p 80:80 stylish-app
