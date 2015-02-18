#/bin/sh

if [ -z "$1" ];
then
	echo "Usage : "
	echo "============================"
	echo "Generating Release Notes:"
	echo "gt rn <tag> get all commit message from git <tag>"
	echo "gt rn <startTag> <endTag> get all commit message from git <startTag> to <endTag>"
	echo "============================"
	echo "Generating gitignore:"
	echo "gt ig <language>"
	echo "currently support : objc, swift"
	echo "============================"
else 
	if [ "$1" == "rn" ];
	then 
		if [ -z "$2" ]; then
			echo "Missing tag"
		else
			if [ -z "$3" ]; then
				echo "startTag = $2"
			else 
				echo "startTag = $2 / endTag : $3"
			fi 
		fi
	elif [ "$1" == "ig" ];
	then
		if [ -z "$2" ]; then
			echo "No language found"
		else
			if [ "$2" == "objc" ]; then
				echo "Generating $2 git ignore file on current directory..."	
				curl https://raw.githubusercontent.com/github/gitignore/master/Objective-C.gitignore >> .gitignore
			elif [ "$2" == "swift" ]; then
				echo "Generating $2 git ignore file on current directory..."	
				curl https://raw.githubusercontent.com/github/gitignore/master/Swift-C.gitignore >> .gitignore
			else
				echo "unknown language"
			fi
		fi
	else 
		echo "unknown command"

	fi
fi

