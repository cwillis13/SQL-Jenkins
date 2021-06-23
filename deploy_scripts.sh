

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


