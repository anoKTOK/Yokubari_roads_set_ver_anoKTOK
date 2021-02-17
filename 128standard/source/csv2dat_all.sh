#!/bin/bash
for file in `find . -name '*.csv'`; do
		nkf -wLu --overwrite $file
		../bin/csv2dat $file
		echo "  extracting $file"
done
#cat ../pakset/config/simuconf_base.tab > ../pakset/config/simuconf.tab
cat simuconf_liveries.tab >> ../pakset/config/simuconf.tab

for file in `find . -name '*.tab'`; do
		if [ $file = "./simuconf_liveries.tab" ]
		then
				echo $file
				continue
		fi
		nkf -wLu --overwrite $file
		sed -i '1i§#' $file
		mv $file ../pakset/text
done
