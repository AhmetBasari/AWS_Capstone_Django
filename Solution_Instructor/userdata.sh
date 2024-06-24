#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt-get install git -y
apt-get install python3 -y
apt install python3-pip -y
pip3 install boto3
apt  install awscli -y
cd /home/ubuntu/
TOKEN=$(aws --region=us-east-1 ssm get-parameter --name /Ahmet/Capstone/token --with-decryption --query 'Parameter.Value' --output text)
git clone https://$TOKEN@github.com/AhmetBasari/AWS_Capstone_Django.git
cd /home/ubuntu/AWS_Capstone_Django
apt-get install python3.10-dev default-libmysqlclient-dev -y
pip3 install -r requirements.txt
cd /home/ubuntu/AWS_Capstone_Django/src
python3 manage.py collectstatic --noinput
#python3 manage.py makemigrations
#python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:80
