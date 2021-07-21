#!/bin/bash

LOG=/tmp/roboshoplogs/frontend.log

echo -n -e "\t\e[32m1. Installing Nginx\t....\e[0m"
yum install nginx -y &>> $LOG
if [ $? -eq 0 ]; then
	echo -e "\e[33mDone\e[0m"
else
	echo -e "\e[33mfailed\e[0m (\e[31mPlease check the Errors in Log file at - $LOG\e[0m)"
	exit 1
fi

echo -n -e "\t\e[32m2. Starting Nginx\t....\e[0m"
systemctl start nginx &>> $LOG
if [ $? -eq 0 ]; then
	echo -e "\e[33mDone\e[0m"
else
	echo -e "\e[33mfailed\e[0m (\e[31mPlease check the Errors in Log file at - $LOG\e[0m)"
	exit 1
fi

echo -n -e "\t\e[32m3. Enabling Nginx\t....\e[0m"
systemctl enable nginx &>> $LOG
if [ $? -eq 0 ]; then
	echo -e "\e[33mDone\e[0m"
else
	echo -e "\e[33mfailed\e[0m (\e[31mPlease check the Errors in Log file at - $LOG\e[0m)"
	exit 1
fi
