#/bin/sh

if [ -z "$1" ];
then
	echo "No command"
else 
	if [ "$1" == "rn" ];
	then 
		echo "Release notes: from tag $2 to tag $3"
	elif [ "$1" == "ig" ];
	then
		echo "Generating $2 git ignore file on current directory..."
	else 
		echo "unknown command"

	fi
fi

