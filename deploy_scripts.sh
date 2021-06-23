sqlcmd -U ${SQLSECADM} -P ${SQLSECPASS} -S ${SQLINST} -Q "execute msdb.dbo.sp_start_job @job_name='Grant Jenkins DDL_Admin'"

cat ${INI} | while read line 
do
        echo "Running script ${line}......"
        echo "----------------------------------------------------------------------------------------------"
        sqlcmd -U ${SQLUSERNAME} -P ${SQLPASS} -S ${SQLINST} -d ${DBNAME} -i ${line} -e > ${line}.out
        
        error=`grep 'Level[[:blank:]][0-9][0-9]' ${line}.out`

        if [[ $error ]]; then
                echo "There was an error after executing the SQL script. View ${line}.out for details... EXITING!..."
                echo "----------------------------------------------------------------------------------------------"
                echo ""
                exit 1
        else
                echo "No errors... Moving on..."
                echo "----------------------------------------------------------------------------------------------"
                echo ""
        fi
done

sqlcmd -U ${SQLSECADM} -P ${SQLSECPASS} -S ${SQLINST} -Q "execute msdb.dbo.sp_start_job @job_name='Revoke Jenkins DDL_Admin'"
