#!/usr/bin/env bash

# git reset && 	git checkout . && git clean -fd

for C in sed rename; do
  command -v $C || { echo "$C needs to be installed, aborting"; exit 1; }
done

set -x
shopt -s globstar
D=`date +%Y%m%d`
CURVERSION=`grep '<artifactId>dashj-parent</artifactId>' -A1 pom.xml  | tail -1 | sed 's/.*<version>\(.*\)<\/version>.*/\1/'`

sed -i '/<module>wallettemplate<\/module>/d' pom.xml
sed -i "s/<version>$CURVERSION<\/version>/<version>$CURVERSION-$D<\/version>/" {,**/}pom.xml
sed -i 's/org\.bitcoinj\./org\.dashj\./g' **/*.java
rename -v 's/org\/bitcoinj/org\/dashj/' **/org/bitcoinj
rename 's/org\.bitcoin\./org\.darkcoin\./' **

git add .
git commit -m "rename bitcoinj package to dashj"

git cherry-pick 53827dbf2e8bdf0f5deb4d09ee1e9ec851a6eb10


#check compile
cd bls
./build-bls-signatures.sh
cd ..
mvn -DskipTests clean install

