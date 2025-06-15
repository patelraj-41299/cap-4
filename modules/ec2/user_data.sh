### ec2/user_data.sh
#!/bin/bash
yum update -y
yum install -y docker unzip
systemctl start docker
systemctl enable docker
cd /home/ec2-user
mkdir app
cd app
curl -O https://your-bucket.s3.amazonaws.com/stylish-1.0.0.zip
unzip stylish-1.0.0.zip
cat <<EOF > Dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
EOF
docker build -t stylish-app .
docker run -d -p 80:80 stylish-app
