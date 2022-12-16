#!/bin/sh

# Puppet Task Name: boltplanrun
#
# This is where you put the shell code for your task.
#
#




if [ ! -z "$PT_targets"]
then 
    targets = $PT_targets
else
    targets = 'localhost'

if [ ! -z "$PT_parameters"]
then 
    parameters = $PT_parameters
    paramstatus = true
else
    paramstatus = false
end

if [ $paramstatus ]
