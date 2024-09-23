#!/bin/bash
# update-module-version.sh
REPO_URL="https://github.com/andre-terraform-modules/terraform-aad-modules.git" # Set your repository URL here

# Ensure the repository URL is provided
if [ -z "$REPO_URL" ]; then
  echo "Error: Repository URL must be specified."
  exit 1
fi

# Clone the repository to a temporary directory
TEMP_DIR=$(mktemp -d)
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" >/dev/null 2>&1

# Change to the temporary directory
cd "$TEMP_DIR" || exit 1

# Get the latest tag
LATEST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))

# Clean up the temporary directory
rm -rf "$TEMP_DIR"

# Check if LATEST_TAG is empty
if [ -z "$LATEST_TAG" ]; then
  echo "Error: No tags found in the repository."
  exit 1
else
  # Output the latest tag
  echo "$LATEST_TAG"
fi