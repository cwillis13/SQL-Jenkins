

cat ${INI} | while read line 
do
        echo "Running script ${line}......"
        echo "----------------------------------------------------------------------------------------------"
        #Get filename only
        filename=echo ${line} | sed -n 's/^\(.*\/\)*\(.*\)/\2/p'
        sqlcmd -U ${SQLUSERNAME} -P ${SQLPASS} -S ${SQLINST} -d ${DBNAME} -i ${line} -e > ./logs/${filename}.out.txt
        
        error=`grep 'Level[[:blank:]][0-9][0-9]' ./logs/${filename}.out.txt`

        if [[ $error ]]; then
                echo "There was an error after executing the SQL script. View ./logs/${filename}.out.txt for details... EXITING!..."
                echo "----------------------------------------------------------------------------------------------"
                echo ""
                exit 1
        else
                echo "No errors... Moving on..."
                echo "----------------------------------------------------------------------------------------------"
                echo ""
        fi
done


