#!/bin/sh

export MAVEN_CONFIG=/root/.m2/
export ROOT_FOLDER="$( pwd )"

echo "Root is $ROOT_FOLDER"

if [ -d "${ROOT_FOLDER}/m2" ]; then

        echo "Cache folder found: ${ROOT_FOLDER}/m2/"
        # Replace repo with cache localtion.
        ln -sf "${ROOT_FOLDER}/m2" /root/.m2

fi

# Call initial entrypoint
exec /usr/local/bin/mvn-entrypoint.sh "$@"
