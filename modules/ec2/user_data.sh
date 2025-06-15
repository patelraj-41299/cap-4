#!/bin/bash
yum update -y
yum install -y docker git
systemctl start docker
systemctl enable docker
cd /home/ec2-user

# Clone your GitHub repo
git clone https://github.com/patelraj-41299/cap-4.git
cd cap-4/app/frontend/stylish-1.0.0

# Create Dockerfile
cat <<EOF > Dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
EOF

docker build -t stylish-app .
docker run -d -p 80:80 stylish-app
