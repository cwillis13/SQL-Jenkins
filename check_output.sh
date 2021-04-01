file=$1

error=`grep 'Level[[:blank:]][0-9][0-9]' file`

if [[ $error ]]; then
        echo "There was an error after executing the SQL script... EXITING!..."
else
        echo "No errors... Moving to next script execution..."
fi
