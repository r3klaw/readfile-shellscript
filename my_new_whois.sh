#!/bin/sh
echo "user: "$USER

var=$(date +"%FORMAT_STRING")
now=$(date +"%m_%d_%Y_%H_%M_%S")
echo "date:" $now
timestamp=$(date +"%Y_%m_%d_%H_%M_%S")

choices=(
    'netname'
    'inetnum'
    'people'
    'quit'
)

PS3="Please choose an option between 1-4: "
select choice in "${choices[@]}" ; do
    [[ -n $choice ]] 
        echo "invalid input"
    
    case $choice in
        netname) 
            sort whois_yahoo_mnt.txt | grep "netname"
            sort whois_yahoo_mnt.txt | grep "netname"  > ${choice}_${timestamp}.txt
            echo ${timestamp} >> ${choice}_${timestamp}.txt;;  
        inetnum) 
            sort -V whois_yahoo_mnt.txt | grep "inetnum"
            sort -V whois_yahoo_mnt.txt | grep "inetnum"  > ${choice}_${timestamp}.txt
            echo ${timestamp} >> ${choice}_${timestamp}.txt;;
            people) 
            read -p "Enter your search: "  search
            echo "Searching results for: $search "
            sort whois_yahoo_mnt.txt | grep "$search"
            grep "$search" whois_yahoo_mnt.txt > ${choice}_${timestamp}.txt
            echo ${timestamp} >> ${choice}_${timestamp}.txt;;
        quit)
            echo "program ended";
            break;;
     esac
done


