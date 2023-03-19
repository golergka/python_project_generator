from setuptools import setup, find_packages

setup(
    name="template_project",
    version="0.1.0",
    packages=find_packages("src"),
    package_dir={"": "src"},
    install_requires=[],
    entry_points={
        "console_scripts": [
            "your-entry-point = template_project.main:main",
        ],
    },
)
