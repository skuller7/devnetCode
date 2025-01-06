#!/bin/bash

# Simply reading from  a file sy.yaml, while 

#cat sy.yaml | while read f
#do
#    echo $f
#done

# Parsing with a so called - yq -  package 

yaml_file="sy.yaml"

u1_userName=$(yq 'people.FirstName' "yaml_file")
u1_lastName=$(yq 'people.LastName' "yaml_file")
u1_email=$(yq 'people.Email' "yaml_file")

echo "User First Name:  $u1_userName"
echo "User Last Name:  $u1_lastName"
echo "User Email Address:  $u1_email"

if [ "$u1_userName" == "John Paul Kane"];then
	echo "This is the right person next!"
else
	echo "Something is wrong!"
fi


