# Python Project Generator

This Python project generator allows you to create a new project based on a template with dependency management, Python version management, Git setup, and global command registration.

## Usage

To create a new project based on the provided template, clone this repository or download the generator project to your local machine.

Then, run the `create_new_project.sh` script:

```bash
# Make the script executable
chmod +x create_new_project.sh
./create_new_project.sh <new_project_name>
```

Replace <new_project_name> with the desired name for your new project. The script will ask for the path to generate the project and check if the path is valid. It will also check if Poetry is installed on your system.

The new project will be created in the specified path with the structure adjusted according to the provided project name.

## Requirements

Poetry: This generator requires Poetry for dependency management. If you don't have Poetry installed, visit https://python-poetry.org/docs/#installation for instructions.

## License

This generator project is released under the MIT License. See the LICENSE file for more information.

## Author

This generator project was generated by ChatGPT-4, prompted by Max Yankov (golergka@gmail.com).
