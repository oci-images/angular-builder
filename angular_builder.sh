#!/bin/sh
export NG_CLI_ANALYTICS=ci
echo "Angular Builder Node14"
if [ ! -z "$NPM_MIRROR" ]; then
	npm config set registry $NPM_MIRROR
fi

if [ ! -z "$BUILD_PARAMS" ]; then
	export NG_PARAM="$BUILD_PARAMS"
fi

if [ ! -z "$NPM_BUILD" -a  "$NPM_BUILD" == "true" ]; then
	npm install > npm.log
	npm install jasmine-core@latest
	npm install karma-jasmine-html-reporter@latest
	npm install @types/jasmine@latest
	echo "Building with NPM"
	npm run build $NG_PARAM > build.log
	echo "Finish Build see logs npm.log and build.log"
else
	npm install > npm.log
	npm install jasmine-core@latest
	npm install karma-jasmine-html-reporter@latest
	npm install @types/jasmine@latest
	echo "Building with NG"
	ng build $NG_PARAM > build.log
fi

echo "Finish Build see logs npm.log and build.log"
cat build.log