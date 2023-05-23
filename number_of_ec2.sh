#!/bin/bash

runningInstanceId=$(aws ec2 describe-instances \
--filters "Name=instance-state-name,Values=running" \
--query 'Reservations [*].Instances[*].{Instance:InstanceId}' --output text | wc -l)

stoppedInstanceId=$(aws ec2 describe-instances \
--filters "Name=instance-state-name,Values=stopped" \
--query 'Reservations [*].Instances[*].{Instance:InstanceId}' --output text | wc -l)

allInstancesId=$(aws ec2 describe-instances \
--query 'Reservations [*].Instances[*].{Instance:InstanceId}' --output text | wc -l)

publicInstanceIp=$(aws ec2 describe-instances \
 --filters "Name=instance-state-name,Values=running" \
 --query 'Reservations [*].Instances[*].{PublicIpAdress:PublicIpAddress}' --output text)


echo "nummber of instances: "$allInstancesId
echo "number of running instances: "$runningInstanceId
echo "public ip addresses of running instances: "
for ip in $publicInstanceIp
do
    echo $ip
done
echo "number of stopped instances: "$stoppedInstanceId



