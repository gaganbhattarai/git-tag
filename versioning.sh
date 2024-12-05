#!/bin/bash

# Get the latest tag
LATEST_TAG=$(git describe --tags `git rev-list --tags --max-count=1`)

# If no tags are found, start from v0.0.0
if [ -z "$LATEST_TAG" ]; then
  LATEST_TAG="v0.0.0"
fi

# Extract major, minor, patch
IFS='.' read -r -a VERSION_PARTS <<< "${LATEST_TAG:1}"
MAJOR=${VERSION_PARTS[0]}
MINOR=${VERSION_PARTS[1]}
PATCH=${VERSION_PARTS[2]}

# Increment based on input argument
case "$1" in
  major)
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
    ;;
  minor)
    MINOR=$((MINOR + 1))
    PATCH=0
    ;;
  patch)
    PATCH=$((PATCH + 1))
    ;;
  *)
    echo "Usage: $0 {major|minor|patch}"
    exit 1
    ;;
esac

# Create the new tag
NEW_TAG="v$MAJOR.$MINOR.$PATCH"
git tag $NEW_TAG
git push origin $NEW_TAG
echo "Tagged with $NEW_TAG"
