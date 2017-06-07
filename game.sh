#!/bin/bash 

#### Variable definitions ####

x=0
y=0
declare -a xarr
declare -a yarr

#### Utility functions ####

simulate(){
 echo "sim"
 #this is where the conway's algo goes
}


print_grid(){
    #use groff for markup 
    for i in {1..1000}; do
    printf "\b"
    done
    echo -n "Grid is printed with x=$x, y=$y, xarr=${xarr[@]}, yarr=${yarr[@]}" 
}



#### Setting up the grid ####

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

        
    
