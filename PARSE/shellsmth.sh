#!/bin/bash

# Simply reading from  a file sy.yaml, while 

#cat sy.yaml | while read f
#do
#    echo $f
#done

# Parsing with a so called - yq -  package 

yaml_file="sy.yaml"

# Use yq to extract First Name with index from yaml

u1_userName=$(yq '.people[0].FirstName' "$yaml_file")
u1_lastName=$(yq '.people[0].LastName' "$yaml_file")
u1_email=$(yq '.people[0].Email' "$yaml_file")

# Print all the first lines from variables

echo "User First Name:  $u1_userName"
echo "User Last Name:  $u1_lastName"
echo "User Email Address:  $u1_email"

# Put all extracted First names into array list 

first_names=$(yq '.people[].FirstName' "$yaml_file")

# Convert the names into a single string

name_list=$(echo "$first_names" | tr '\n' ' ' | xargs)

# Print Extracted text!

echo "Extracted Names : $name_list"

# IF statement check if extracted text matches the values.

if [ "$name_list" -eq " John Paul Kane "]; then
	echo "This is the right group of people next!"
else
	echo "Something is wrong!"
fi


