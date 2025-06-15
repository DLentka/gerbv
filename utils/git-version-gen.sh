#!/bin/bash
#
# Generates gerbv version string from a given prefix and the current commit
# short id
#
# @warning Version will only be updated when reconfiguring! Will have no effect
#     on incremental builds
#
# @param $1 Version prefix

set -e


# Validate arguments
PREFIX="${1}"

if [ "" == "${PREFIX}" ]; then
	(>&2 echo "Usage: git-version-gen.sh <prefix>")
	exit 1
fi


# Validate environment
GIT=`command -v git || true`

if [ ! -x "${GIT}" ]; then
	(>&2 echo "\`git' missing")
	echo -n "${PREFIX}"
	exit 0
fi

if ! ${GIT} rev-parse --is-inside-work-tree >& /dev/null ; then
	(>&2 echo "Not inside work tree")
	echo -n "${PREFIX}"
	exit 0
fi

GD=$(git describe --tags --match 'v*.*.*' --long)
LAST_TAG=$(echo $GD | cut -d'-' -f1)
COMMITS_SINCE_TAG=$(echo $GD | cut -d'-' -f2)
SHA=$(echo $GD | cut -d'-' -f3)

# Output final version
if [[ $COMMITS_SINCE_TAG == '0' ]]; then
	echo -n "$LAST_TAG"
else
	echo -n "${LAST_TAG}-dev+${COMMITS_SINCE_TAG}-${SHA}"
fi

