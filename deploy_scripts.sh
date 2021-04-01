scripts=$1

while read file

do

        #echo "sqlcmd -U yxgrr -P password -S sql_instance -d Brim_Jenkins -i $file -e >> ${file}.out"
        #echo "Checking output file ${file}.out"
        echo "here's some sample output for $file execution" > ${file}.out
        echo "catting ${file}.out below"
        cat ${file}.out

done < $scripts
