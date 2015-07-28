#! /bin/sh

# Example:
# sh rebuild.sh /some/directory

echo "Enter the full path at which you want to build ucberkeley_envconf (default: /tmp): \c"
read BUILD_DIR

if [ -z "$BUILD_DIR" ];
then
  BUILD_DIR="/tmp"
fi

if ! [ -d "$BUILD_DIR" ];
then
  echo "$BUILD_DIR is not a directory."
  exit 1
fi

echo "Building in $BUILD_DIR:\n"

# remove any old builds
if [ -d "$BUILD_DIR/ucberkeley_envconf" ];
then
  rm -rf $BUILD_DIR/ucberkeley_envconf
fi

REPO_DEFAULT=git@github.com:bwood/ucberkeley_envconf-7.git
echo "What repostiory do you want to clone from? (default: $REPO_DEFAULT)"
read REPO

if [ -z "$REPO" ];
then
  REPO=$REPO_DEFAULT
fi

cd $BUILD_DIR
git clone $REPO

# Normalize directory name
mv ucberkeley_envconf-7 ucberkeley_envconf

BRANCH_DEFAULT=master
echo ""
echo "What branch do you want code from? (default: $BRANCH_DEFAULT)"
read BRANCH

if [ -z "$BRANCH" ];
then
  BRANCH=$BRANCH_DEFAULT
fi

if [ "$BRANCH" != "master" ]; then
  cd ucberkeley_envconf
  git fetch origin
  git checkout $BRANCH
  cd ..
fi

# rm .git/ and .gitignore
rm -rf ucberkeley_envconf/.git*
rm ucberkeley_envconf/rebuild.sh
# get the version from the info file
VER=`awk -F = '/version =.*$/{gsub(/ /, "", $0); print $2}' ucberkeley_envconf/ucberkeley_envconf.info`
echo ""
while [[ ! "$CONFIRM" == "y" ]] && [[ ! "$CONFIRM" == "n" ]]; do
  echo "Create this tarball: ucberkeley_envconf-$VER.tar.gz? (y/n)"
  read CONFIRM
done

if [ "$CONFIRM" == "y" ];then
  tar zcf ucberkeley_envconf-$VER.tar.gz ucberkeley_envconf
else
  echo "Okay, no tarball."
fi

echo ""
echo "find $BUILD_DIR/ucberkeley_envconf* :"
echo ""
find $BUILD_DIR/ucberkeley_envconf*

