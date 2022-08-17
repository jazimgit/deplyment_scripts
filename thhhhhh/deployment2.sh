#!/bin/bash

copy_folder=$1
value=$2
DEST_PATH="/opt/th"


if [ "${copy_folder}" = "ALL" ]
then
     if [ -z "$value" ]
      then
           for i in `ls -l | grep ^d | awk '{print $9}'`
           do
              cp -r $i $DEST_PATH
           done
       else
            echo "************************************************************************"
            echo "**** PLEASE SELECT VALUE IF YOU WANT TO DEPLOY PERTICULAR FOLDER *******"
            echo "************************************************************************"
            exit 1;
       fi
elif [ "${copy_folder}" = "VALUE" ]
then
      if [ -z "$value" ]
       then
            echo "**********************************************************"
            echo "*****PLEASE ENTER FOLDER NAME TO COPY IN DESTINATION *****"
            echo "**********************************************************"
            exit 1;
        else
              for i in `echo "$value" | tr "," " "`
               do
                   folder=$(ls -l | grep ^d | awk '{print $9}' | grep $i)
                   echo "****** copying $folder on destination **********"
                   cp -r ${folder} $DEST_PATH
               done
        fi
fi
