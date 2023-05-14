#!/bin/bash

clear

printf " 	   		      _____ _   _ _   _ __  __ ____    _    ____ _____ 
                             | ____| \ | | | | |  \/  / ___|  / \  / ___|_   _|
                             |  _| |  \| | | | | |\/| \___ \ / _ \| |     | |  
                             | |___| |\  | |_| | |  | |___) / ___ \ |___  | |  
                             |_____|_| \_|\___/|_|  |_|____/_/   \_\____| |_|  
                                                                               "





printf "\nWhat you want to use?\n 1) nmap & gobuster \n 2) nmap \n 3) gobuster \n 4) gobuster advanced \n 5) ssh \n 6) ftp"
printf "\nValue: "

read first_value
wordlists="common.txt"


if [[ $first_value == 1 ]]; then
	printf "\nEnter the ip\n ip:"
	read ip
	printf "Do you want to save the result  as TEXT file?\n y/n: "
	read choice
		if [[ $choice == y || $choice == Y ]]; then
			printf "Enter the file name to save\n filename: "
			read filename
			nmap -sC -sV $ip -oN $filename

		elif [[ $choice == n || $choice == N ]]; then
			nmap -sC -sV $ip
		else
			printf "\nInvalid Input\n"
		fi
echo ""
echo ""
	echo "nmap scanning completed"
	printf "\n\n\n\n"
	echo "Initializing Web Enumeration"
	sleep 0.3
	echo "*"
	sleep 0.3
	echo "**"
	sleep 0.3
	echo "***"
	sleep 0.3
	echo "****"
	sleep 0.3
	printf "\n\n\n\n"
	gobuster dir -u $ip -w $wordlists

elif [[ $first_value == 2 ]]; then
	printf "\nEnter the target ip\n ip: "
	read ip
	printf "\nDo you want to save the result  as TEXT file?\n y/n: "
    read choice
        if [[ $choice == y || $choice == Y ]]; then
            printf "\nEnter the file name to save\n filename: "
            read filename
            nmap -sC -sV $ip -oN $filename

        elif [[ $choice == n || $choice == N ]]; then
            nmap -sC -sV $ip
        else
            printf "\nInvalid Input\n"
        fi

elif [[ $first_value == 3 ]]; then

	printf "\nEnter the target web address\n Web Address: "
	read web_address
	gobuster dir -w common.txt -u $web_address

elif [[ $first_value == 4 ]]; then
	printf "\nChoose the wordlist you want to use \n 1) big.txt \n 2) common.txt \n 3) directory list 2.3 medium \n 4) small \n Value: "
	read wordlist
	printf "\nEnter the target Web Address \n Web Address: "
	read web_address
	
		if [[ $wordlist == 1 ]]; then
		gobuster dir -w big.txt -u $web_address 

		elif [[ $wordlist == 2 ]]; then
		gobuster dir -w common.txt -u $web_address

		elif [[ $wordlist == 3 ]]; then
		gobuster dir -w directory-list-2.3-medium.txt -u $web_address

		elif  [[ $wordlist == 4 ]]; then
		gobuster dir -w small.txt -u $web_address

		else
		echo "\nInvalid Input"
		fi
elif [[ $first_value == 5 ]]; then
	printf "\nEnter the ip \n ip: "
	read ip
	printf "\nEnter the Username \n Username: "
	read username
	ssh $username@$ip

elif [[ $first_value == 6 ]];then
	printf "\nEnter the ip\n ip: "
	read ip	
	ftp $ip

else
	printf "\nInvalid Input\n"
fi

