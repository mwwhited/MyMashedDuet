for file in duet3/dsf/sd/sys/*.json
do 
	echo make $file pretty
	export newFile=$(echo $file | sed 's/\(.*\.\)json/\1formatted.json/')
	cat $file | python -m json.tool > $newFile
	mv -f $newFile $file
done
python cleanDwcSettings.py duet3/dsf/sd/sys/dwc2settings.json > duet3/dsf/sd/sys/dwc2settings.formatted.json
mv -f duet3/dsf/sd/sys/dwc2settings.formatted.json  duet3/dsf/sd/sys/dwc2settings.json
