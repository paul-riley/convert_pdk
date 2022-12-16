#!/bin/sh

# Puppet Task Name: boltplanrun
#
# Runs a Bolt plan on a remote target after validating inputs... Always validate!


if [[ ! -z "$PT_project_directory" ]];
then 
    project_directory=$PT_project_directory
else
    echo 'project_directory is unset'
    exit 1
fi

if [[ ! -z "$PT_plan" ]] && [[ "$PT_plan" == *"::"* ]];
then 
    plan=$PT_plan
else
    echo 'plan is not set correctly'
    exit 1
fi

if [[ ! -z "$PT_parameters" ]] && [[ "$PT_parameters" == "@"* ]]; 
then 
    parameters=$PT_parameters
    paramtype='file'
elif [[ ! -z "$PT_parameters" ]];
then
    parameters=$PT_parameters
    paramtype='string'
fi


cd $project_directory

#Run Command
if [[ "$parameters" ]] && [[ "$paramtype" == "file" ]];
then
    bolt plan run "$plan" --params $parameters
elif [[ "$parameters" ]] && [[ "$paramtype" == "string" ]];
then
    bolt plan run "$plan" "$parameters"
else
    bolt plan run "$plan"
fi
