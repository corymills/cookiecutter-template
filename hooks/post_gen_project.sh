#!/bin/bash
git init
{% if cookiecutter.gitlab_repo_url != "" %}
git remote add origin {{cookiecutter.gitlab_repo_url}}
{% endif %}

python3 -m venv venv_{{cookiecutter.project_slug}}
source venv_{{cookiecutter.project_slug}}/bin/activate
which pip

venv_{{cookiecutter.project_slug}}/bin/pip install ipykernel
venv_{{cookiecutter.project_slug}}/bin/python -m ipykernel install --user --name=venv_{{cookiecutter.project_slug}}

venv_{{cookiecutter.project_slug}}/bin/pip install pip-tools
venv_{{cookiecutter.project_slug}}/bin/pip-compile requirements_dev.in
venv_{{cookiecutter.project_slug}}/bin/pip-sync requirements_dev.txt
