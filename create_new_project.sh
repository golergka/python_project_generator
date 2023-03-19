#!/bin/bash

# Check if poetry is installed
command -v poetry >/dev/null 2>&1 || {
  echo >&2 "Poetry is not installed. Please install Poetry and try again. Visit https://python-poetry.org/docs/#installation for instructions."
  exit 1
}

# Get the new project name
if [ -z "$1" ]; then
  echo "Usage: $0 <new_project_name>"
  exit 1
fi

new_project_name=$1

# Ask for the path to generate the project
read -p "Enter the path to generate the project (default: current directory): " project_path

if [ -z "$project_path" ]; then
  project_path="."
fi

# Check if the path is valid
if [ ! -d "$project_path" ]; then
  echo "Error: Invalid path. Please enter a valid directory."
  exit 1
fi

template_project_path="template_project"

# Copy the template project and replace placeholders
cp -R $template_project_path "$project_path/$new_project_name"
cd "$project_path/$new_project_name"
sed -i "s/template_project/$new_project_name/g" pyproject.toml
sed -i "s/template_project/$new_project_name/g" setup.py
mv src/template_project src/$new_project_name

# Initialize a new Git repository
git init
git add .
git commit -m "Initial commit based on the template_project"

echo "New project $new_project_name has been created successfully at $project_path/$new_project_name."
