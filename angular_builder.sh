#!/bin/sh
export NG_CLI_ANALYTICS=ci
echo "Angular Builder Node14"
if [ ! -z "$NPM_MIRROR" ]; then
	exec "npm config set registry $NPM_MIRROR"
fi
npm install > npm.log
npm install jasmine-core@latest
npm install karma-jasmine-html-reporter@latest
npm install @types/jasmine@latest
echo "Building"
npm run build > build.log
echo "Finish Build see logs npm.log and build.log"