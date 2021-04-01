cat ${INI} | while read line 
do
   #     echo "sqlcmd -U ${SQLUSERNAME} -P ${sqlpass} -S ${SQLINST} -d ${DBNAME} -i JenkinsTestTable.sql -e > JenkinsTestTable_load_exec_log_FIXED.txt"
        echo "Running script ${line}......"
        echo "----------------------------------------------------------------------------------------------"
        sqlcmd -U ${SQLUSERNAME} -P ${SQLPASS} -S ${SQLINST} -d ${DBNAME} -i ${line} -e > ${line}.out
        
        error=`grep 'Level[[:blank:]][0-9][0-9]' ${line}.out`

        if [[ $error ]]; then
                echo "There was an error after executing the SQL script. View ${line}.out for details... EXITING!..."
                echo "----------------------------------------------------------------------------------------------"
                exit 1
        else
                echo "No errors... Moving on..."
                echo "----------------------------------------------------------------------------------------------"
        fi
done
