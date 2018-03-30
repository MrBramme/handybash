#!/bin/bash

while getopts ":i:o:sch" opt; do
  case $opt in
    i) arg_input="$OPTARG"
    ;;
    o) arg_output="$OPTARG"
    ;;
    c) arg_clearDir="$OPTARG"
    ;;
    s) arg_silent=1
    ;;
    h) 
        echo "--------------------------------------"
        echo "----------------HELP------------------"
        echo "Copy files from one dir to another"
        echo "Arguments:"
        echo "  -i <dir> : Input directory"
        echo "  -o <dir> : Output directory"
        echo "  -s : Silent"
        echo "  -c : Clear directory first"
        echo "  -h : Show help"
        exit 0
    ;;
    \?) 
        echo "ERROR: Invalid option -$OPTARG"
        echo "Ending script"
        exit 1
    ;;
  esac
done


echo "--------------------------------------"
echo "--------------Starting----------------"
printf "Copy from: %s\n" "$arg_input"
printf "Copy to: %s\n" "$arg_output"
if [[ $arg_clearDir ]]; then
	echo "With Clear Dir"
fi
echo "--------------------------------------"

#### Directory Checkings
    #check if the input dir exists
    if [[ ! -d $arg_input ]]; then
    	echo "ERROR: Input directory does not exist (${arg_input})"
    	exit 1
    fi

    #check if the output dir exists and if not create it
    if [[ ! -d $arg_output ]]; then
        if [[ ! $arg_silent ]]; then
            read -p "Create directory ${arg_output} (y/n): " temp_force
            if [[ $temp_force = "y" ]]; then
                arg_silent=1
            fi
        fi
    	if [[ $arg_silent ]]; then
            #if not: create  dir
    	    if mkdir "$arg_output"; then
    	    	echo "INFO: Created ${arg_output}"
    	    else
    	    	echo "ERROR: Could not create ${arg_output}"
    	    	exit 1
    	    fi
        fi
    fi
#### \Directory Checkings

if [[ $arg_clearDir ]]; then
    echo "INFO: Clearing ${arg_output}"
    rm -rf $arg_output/*
fi

cp -R $arg_input/. $arg_output
echo "INFO: Done"
