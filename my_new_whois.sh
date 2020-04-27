#!/bin/sh

filename="$1" 

if [[ $filename ]]
then
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
    [[ -n $choice ]] ||
        echo "invalid input"
    
    case $choice in
        netname) 
            sort ${filename} | grep "netname"  > ${choice}_${timestamp}.txt
            echo "Scripted completed and exported as" ${choice}_${timestamp}.txt
            echo "file created at:" ${timestamp} >> ${choice}_${timestamp}.txt;;  
        inetnum) 
            sort -V ${filename} | grep "inetnum"  > ${choice}_${timestamp}.txt
            echo "Scripted completed and exported as" ${choice}_${timestamp}.txt
            echo "file created at:" ${timestamp} >> ${choice}_${timestamp}.txt;;
            people) 
            grep "person" ${filename} | sort | uniq > ${choice}_${timestamp}.txt
            echo "Scripted completed and exported as" ${choice}_${timestamp}.txt
            echo "file created at:" ${timestamp} >> ${choice}_${timestamp}.txt;;
        quit)
            echo "program ended";
            break;;
     esac
done

else
 echo "please Execute the script in this order: myscript.sh [inputFile] "
fi


