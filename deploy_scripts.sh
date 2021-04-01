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
        echo "Running script ${line}......"
        echo "----------------------------------------------------------------------------"
        sqlcmd -U ${SQLUSERNAME} -P ${SQLPASS} -S ${SQLINST} -d ${DBNAME} -i ${line} -e > ${line}.out
        
        error=`grep 'Level[[:blank:]][0-9][0-9]' ${line}.out`

        if [[ $error ]]; then
                echo "There was an error after executing the SQL script... EXITING!..."
                exit
        else
                echo "No errors... Moving to next script execution..."
        fi
done
