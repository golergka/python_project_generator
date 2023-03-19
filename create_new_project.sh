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
else
  # Replace tilde with the actual home directory path
  project_path="$(eval echo $project_path)"
  # Remove any trailing slashes
  project_path="${project_path%/}"
fi

# Check if the path is valid
if [ ! -d "$project_path" ]; then
  echo "Error: Invalid path: $project_path. Please enter a valid directory."
  exit 1
fi

# Create the new project subfolder
mkdir -p "$project_path/$new_project_name"
if [ ! -d "$project_path/$new_project_name" ]; then
  echo "Error: Failed to create project directory: $project_path/$new_project_name."
  exit 1
fi

# Set the absolute path to the template_project directory
template_project_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/template_project"

# Copy the template project and replace placeholders
cp -R $template_project_path/* "$project_path/$new_project_name"
if [ ! -d "$project_path/$new_project_name" ]; then
  echo "Error: Failed to copy the template project to the new project directory: $project_path/$new_project_name."
  exit 1
fi

cd "$project_path/$new_project_name" || { echo "Error: Failed to change directory to the new project."; exit 1; }
echo "Current working directory: $(pwd)"

entry_point_name="${new_project_name//-/_}"

if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  sed -i '' "s/template_project/$new_project_name/g" pyproject.toml
  sed -i '' "s/template_project/$new_project_name/g" setup.py
  sed -i '' "s/template_project/$new_project_name/g" README.md
  sed -i '' "s/your-entry-point/$entry_point_name/g" pyproject.toml
  sed -i '' "s/your-entry-point/$entry_point_name/g" setup.py
  sed -i '' "s/your-entry-point/$entry_point_name/g" README.md
else
  # Linux
  sed -i "s/template_project/$new_project_name/g" pyproject.toml
  sed -i "s/template_project/$new_project_name/g" setup.py
  sed -i "s/template_project/$new_project_name/g" README.md
  sed -i "s/your-entry-point/$entry_point_name/g" pyproject.toml
  sed -i "s/your-entry-point/$entry_point_name/g" setup.py
  sed -i "s/your-entry-point/$entry_point_name/g" README.md
fi


mv src/template_project src/$new_project_name

# Initialize a new Git repository
git init
git add .
git commit -m "Initial commit based on the template_project"

echo "New project $new_project_name has been created successfully at $project_path/$new_project_name."
