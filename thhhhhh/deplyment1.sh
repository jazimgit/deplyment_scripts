#!/bin/bash

ENV=$1
if [ "$ENV" = "QA" ]; then
     prifix=qa
     destination=darwin_proda
elif [ "$ENV" = "UAT" ]; then
     prifix=uat
elif [ "$ENV" = "prod" ]; then
     prifix=prod
fi

change_in_file() {
file=$1
src=$2
dest=$3
for ch in `find . -name ${file}`
do
    sed -i s/${src}/${dest}/g $ch
done
}


for i in `ls -l | grep ^d | awk '{print $9}'`
do
   mv $i ${prifix}_$i
done

change_in_file sp_change_name.sql __BQ_PROJECT__ project_id
