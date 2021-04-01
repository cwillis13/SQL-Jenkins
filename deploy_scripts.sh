#user=$1
#pw=$2
#instance=$3
#db=$4
#scripts=$5

#while read file

#do

        #echo "sqlcmd -U yxgrr -P password -S sql_instance -d Brim_Jenkins -i $file -e >> ${file}.out"
        #echo "Checking output file ${file}.out"
        #echo "sqlcmd -U ${SQLUSERNAME} -P ${sqlpass} -S ${SQLINST} -d ${DBNAME} -i JenkinsTestTable.sql -e > JenkinsTestTable_load_exec_log_FIXED.txt"
        #sqlcmd -U $user -P $pw -S $instance -d $db -i "$file" -e > JenkinsTestTable_load_exec_log_FIXED.txt

#done < $scripts

cat ${INI} | while read line 
do
   #     echo "sqlcmd -U ${SQLUSERNAME} -P ${sqlpass} -S ${SQLINST} -d ${DBNAME} -i JenkinsTestTable.sql -e > JenkinsTestTable_load_exec_log_FIXED.txt"
        sqlcmd -U ${SQLUSERNAME} -P ${SQLPASS} -S ${SQLINST} -d ${DBNAME} -i ${line} -e > ${line}.out
        echo "done"
done
