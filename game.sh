#!/bin/bash 

#### Variable definitions ####

x=0
y=0
declare -a xarr
declare -a yarr
count=0

#### Utility functions ####

simulate(){
 echo "sim"
 #this is where the conway's algo goes
}


print_grid(){
    echo -n "$(tput clear)" #used to clear the screen
    printf "+-----------------------+\n"
    for i in {0..10}; do 
        for j in {0..10}; do  
            if point_on_grid $i $j ; then 
            
                if [[ $j -eq 10 ]]; then 
                    printf "o |\n"
                else
                    if [[ $j -eq 0 ]]; then     
                        printf "| o "
                    else
                        
                        printf "o "
                    fi 
                fi 
            else
                if [[ $j -eq 10 ]]; then 
                    printf "  |\n"
                else
                    if [[ $j -eq 0 ]]; then 
                        printf "|   "
                    else
                    
                        printf "  " 
                    fi 
                fi 
            fi 
        done
    done 
            
    printf "+-----------------------+\n"

}

point_on_grid(){
    for (( k=0; k<${count}; k++ )); do 
        if [[ $1 -eq ${yarr[$k]} ]]; then
            if [[ $2 -eq ${xarr[$k]} ]]; then 
                return 0 #true
            fi 
        fi 
    done 
    return 1 #false
} 


#### User interface ####

while true; do
    print_grid #print the grid
    read -n 1 -s inputs
    case $inputs in 
    
    
        x) 
            break 
            
            ;;
        
        d) 
            if [[ $x -eq 10 ]]; then 
                #console_print "Can't break the wall"
                continue 
            fi 
            x=$((x+1))
            continue
            ;;
        
        a)  if [[ $x -eq 0 ]]; then 
                #console_print "Can't break the wall"
                continue
            fi 
            x=$((x-1))
            continue 
            ;;
            
        s)  if [[ $y -eq 10 ]]; then 
                #console_print "Can't break the wall"
                continue
            fi 
            y=$((y+1))
            continue 
            ;;
            
        w)  if [[ $y -eq 0 ]]; then 
                #console_print "Can't break the wall"
                continue 
            fi
            y=$((y-1))
            continue
            ;;
            
        o) 
           
            xarr+=($x)
            yarr+=($y)
            ((count++))
            continue
            ;;
        
        *) 
            continue 
            ;;
        
    esac
done 
exit
#print_grid $x $y $xarr $yarr $print the grid 

#simulate $xarr $yarr 

        
    
