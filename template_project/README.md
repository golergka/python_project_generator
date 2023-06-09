# Template Python Project

This template project provides a simple structure to quickly set up a Python project with dependency management, Python version management, Git setup, and global command registration.

## Project Structure

```
template_project/
│
├── .gitignore
├── pyproject.toml
├── README.md
├── setup.py
└── src/
    └── template_project/
        ├── init.py
        └── main.py
```

- `.gitignore`: A standard Python `.gitignore` file to avoid committing unwanted files.
- `pyproject.toml`: This file is used to manage dependencies and specify the required Python version. We use Poetry for dependency management.
- `README.md`: A description of your project, installation instructions, usage, and any other relevant information.
- `setup.py`: This file is used to make your project installable via `pip` and to register the script as a global command.
- `src/template_project/`: This is where your actual project code should be placed.
- `src/template_project/__init__.py`: Empty file that is used to mark a directory as a Python package. It allows the Python interpreter to treat the directory as a package, which means you can import modules and functions from this directory in other Python scripts.

## Development

To work with the project, you will need to have Poetry installed (https://python-poetry.org/docs/#installation).

To install the project dependencies:

```bash
poetry install
```

To run the project:

```bash
poetry run your-entry-point
```

To build and package the project:

```bash
poetry build
```

To install the project locally as a global command:

```bash
pip install --editable .
```

Now, you can run the command from anywhere in your system:

```bash
your-entry-point
```

Don't forget to replace `your-entry-point` with the desired command name specified in `setup.py`.

## Dependencies and poetry.lock

This project uses [Poetry](https://python-poetry.org/) for dependency management. The `poetry.lock` file contains information about the exact versions of the dependencies used in the project. It is recommended to commit this file to the repository to ensure consistent behavior across different environments.

When you install the project dependencies using `poetry install`, Poetry will use the versions specified in the `poetry.lock` file. If you want to update the dependencies to their latest versions, you can run `poetry update`.

## Adding a new dependency

To add a new dependency to the project, use the `poetry add` command followed by the package name. For example, if you want to add the `requests` library, run:

```bash
poetry add requests
```

This command will update the `pyproject.toml` file with the new dependency and update the `poetry.lock` file with the exact version of the package being used. Make sure to commit both the updated `pyproject.toml` and `poetry.lock` files to the repository.

For more information about managing dependencies with Poetry, refer to the [Poetry documentation](https://python-poetry.org/docs/dependency-management/).
