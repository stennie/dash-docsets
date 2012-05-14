#!/bin/bash

echo "===> Documentation generator for Yii Framework"

USAGE="$0 -c{0|1} -s{#} -d{0|1} -h{0|1}
 -c (boolean) CLEAN output directories before generating (default: 0)
 -s (int) SLEEP for # seconds between major steps (default: 1)
 -d (boolean) generate DOCSET documentation? (default: 1)
 -o (boolean) generate OTHER documentation formats (OTHER, ..)? (default: 0)
 -a (boolean) regnerate ALL (equivalent to -c1 -d1 -h1)
"

while getopts ':a:c:d:h:s:' opt
do
	case $opt in
		a)  CLEAN=1
			DOCSET=1
			OTHER=1
			;;
		c) CLEAN=$OPTARG;;
		d) DOCSET=$OPTARG;;
		o) OTHER=$OPTARG;;
		s) SLEEP=$OPTARG;;
		h) echo "USAGE: $USAGE"
		   exit 1;;
		\?) echo "ERROR: Invalid parameter passed."
			echo ""
			echo "USAGE: $USAGE"
			exit 1;;
	esac
done

# Remove output dirs before building
: ${CLEAN:=0}

# Brief pause between steps
: ${SLEEP:=1}

# Generate DocSet doco?
: ${DOCSET:=1}

# Generate OTHER doco?
: ${OTHER:=0}

echo "$USAGE"
echo ""
echo "### Current setings"
echo "  # [$CLEAN] CLEAN output directories before build?"
echo "  # [$SLEEP] SLEEP for # seconds between steps"

if [[ $DOCSET == 1 ]]; then
	echo ""
	echo "===> Building DocSet version"
	sleep $SLEEP
	
	if [[ -d "docset" && $CLEAN != 0 ]]; then
		echo " ==> Removing old DocSet files"
		#rm -rf docset
	fi
	
	echo " ==> Doxygeneration"
	sleep $SLEEP
	time doxygen Docset.dox
	echo " ==> Building DocSet"
	sleep $SLEEP
	cd docset/html
	make
	sleep $SLEEP
	echo " ==> Creating tarball"
	tar --exclude='.DS_Store' -cvzf docset/Yii.tgz docset/html/com.yiiframework.com.docset
fi

if [[ $OTHER == 1 ]]; then
	echo ""
	echo "===> Building OTHER versions (Searchable HTML)"
	sleep $SLEEP
	if [[ -d "output" && $CLEAN != 0 ]]; then
		echo " ==> Removing old output files"
		rm -rf output
	fi
	
	echo " ==> Doxygeneration"
	sleep $SLEEP
	time doxygen Yii.dox
fi

echo ""
echo "===> DONE!"