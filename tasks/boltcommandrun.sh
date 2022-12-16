#!/bin/sh -v

# Puppet Task Name: boltcommandrun
#
#
# Runs a Bolt command on a remote target after validating inputs... Always validate!

if [[ ! -z "$PT_project_directory" ]];
then 
    project_directory=$PT_project_directory
else
    echo 'project_directory is unset'
    exit 1
fi

if [[ ! -z "$PT_command" ]];
then 
    command=$PT_command
else
    echo "command is unset"
    exit 1
fi

if [[ ! -z "$PT_targets" ]];
then 
    targets=$PT_targets
else
    targets='localhost'
fi


cd $project_directory

#Run command

bolt command run "$command" --targets $targets

