#/bin/sh

if [ -z "$1" ];
then
	echo "Usage : "
	echo "============================"
	echo "Generating Release Notes:"
	echo "gt rn get all commit message from last tag found by git describe"
	echo "gt rn <tag> get all commit message from git <tag>"
	echo "gt rn <startTag> <endTag> get all commit message from git <startTag> to <endTag>"
	echo "============================"
	echo "Generating gitignore:"
	echo "gt ig <language>"
	echo "currently support : objc, swift, android"
	echo "============================"
else 
	if [ "$1" == "rn" ]; then
		if [[ -n $(git tag) ]]; then
			if [ -z "$2" ]; then
				GIT_RELEASE_VERSION=$(git describe --abbrev=0)
				git log --pretty=format:%s ${GIT_RELEASE_VERSION}.. --no-merges | sort -d
			else
				if [ -z "$3" ]; then
					GIT_RELEASE_VERSION=$($2)
					git log --pretty=format:%s ${GIT_RELEASE_VERSION}.. --no-merges | sort -d
				else 
					GIT_RELEASE_VERSION = $($2)
					GIT_RELEASE_VERSION_ENDING = $($3)
					git log --pretty=format:%s ${GIT_RELEASE_VERSION}..${GIT_RELEASE_VERSION_ENDING} --no-merges | sort -d
				fi 
			fi
		else 
			echo "no tags found"
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
			elif [ "$2" == "android" ]; then
				echo "Generating $2 git ignore file on current directory..."	
				curl https://raw.githubusercontent.com/github/gitignore/master/Android.gitignore >> .gitignore
			else
				echo "unknown language"
			fi
		fi
	else 
		echo "unknown command"

	fi
fi

