#!/bin/bash 

#### Variable definitions ####

x=0
y=0
declare -a xarr
declare -a yarr
declare -a xarr_temp
declare -a yarr_temp
count=0

#### Utility functions ####

simulate(){
    
    for i in {0..10}; do 
        for j in {0..10}; do 
            local point_count
            point_count=0
            for (( i_temp=$(( i - 1)) ; i_temp<=$(( i + 1 )); i_temp++ )); do 
                for (( j_temp=$((j - 1)); j_temp<=$(( j + 1)); j_temp++)); do 
                    if point_on_grid ${i_temp} ${j_temp}; then
                        ((point_count++))
                        
                    fi 
                    
                    
                done
            done 
            if point_on_grid $i $j; then
                ((point_count--))
                if [[ ($point_count -eq 3) || ($point_count -eq 2) ]]; then 
                yarr_temp+=($i)
                xarr_temp+=($j)
                fi 
            else
                if [[ $point_count -eq 3 ]]; then 
                yarr_temp+=($i)
                xarr_temp+=($j)
                fi 
            fi 
            
            
            
        done
    done
    
    unset xarr
    unset yarr
    for index in ${!xarr_temp[@]}; do 
        xarr[$index]=${xarr_temp[$index]}
        yarr[$index]=${yarr_temp[$index]}
    done 
    unset xarr_temp
    unset yarr_temp
   
    
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
        if [[ $1 == ${yarr[$k]} ]]; then
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
            if point_on_grid $y $x; then 
                continue
            fi 
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

while true; do 
    simulate 
    sleep 1
    print_grid
    
    
done

        
        
    
