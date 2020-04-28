for file in duet3/dsf/sd/sys/*.json
do 
	echo make '$file' pretty
	export newFile=$(echo $file | sed 's/\(.*\.\)json/\1formatted.json/')
	cat $file | python -m json.tool > $newFile
	mv -f $newFile $file
	
done
