#!/bin/sh
echo $USER

var=$(date +"%FORMAT_STRING")
now=$(date +"%m_%d_%Y_%H_%M_%S")
printf "%s\n" $now
today=$(date +"%Y_%m_%d_%H_%M_%S")

options=(
    'people'
    'inetnum'
    'netname'
    'quit'
)

PS3="Please choose an option: "
select option in "${options[@]}" ; do
    [[ -n $option ]] 
        echo "invalid input"
    
    case $option in
        people) 
            read -p "Enter your search: "  search
            echo "Search results for: $search "
            sort whois_yahoo_mnt.txt | grep "$search"
            grep "$search" whois_yahoo_mnt.txt > ${option}_${today}.txt
            echo ${today} >> ${option}_${today}.txt;;
        inetnum) 
            sort -V whois_yahoo_mnt.txt | grep "inetnum"
            sort -V whois_yahoo_mnt.txt | grep "inetnum"  > ${option}_${today}.txt
            echo ${today} >> ${option}_${today}.txt;;
            netname) 
            sort whois_yahoo_mnt.txt | grep "netname"
            sort whois_yahoo_mnt.txt | grep "netname"  > ${option}_${today}.txt
            echo ${today} >> ${option}_${today}.txt;;
        quit)
            echo "script ended";
            break;;
     esac
done


