#!/bin/sh -v

# Puppet Task Name: boltcommandrun
#
# This is where you put the shell code for your task.
#

#Test data
##bolt command run @command/echolocal --targets localhost
# PT_project_directory='/Users/paulriley/projects/testproject'
# PT_command='@command/echolocal' 


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

#Setup pipe to write output && change dir

# pipe=/tmp/testpipe

# trap "rm -f $pipe" EXIT

# if [[ ! -p $pipe ]];
# then
#     mkfifo $pipe
# fi

cd $project_directory

#Run command

bolt command run "$command" --targets $targets
# /usr/local/bin/bolt command run "$command" --targets $targets >$pipe
# echo 'quit'>>$pipe

# #Echo output from pipe

# while true
# do
#     if read line <$pipe; then
#         if [[ "$line" == 'quit' ]]; then
#             break
#         fi
#         echo $line
#     fi
# done
