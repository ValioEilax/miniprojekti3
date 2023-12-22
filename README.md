# miniprojekti3
[![GHA workflow badge](https://github.com/ValioEilax/miniprojekti3/workflows/CI/badge.svg)](https://github.com/ValioEilax/miniprojekti3/actions/workflows/main.yml) 
[![codecov](https://codecov.io/gh/ValioEilax/miniprojekti3/graph/badge.svg?token=8WIEWYAJCL)](https://codecov.io/gh/ValioEilax/miniprojekti3)

## Description:

Miniproject-exercise of group number 3 for a course "TKT20006 - Ohjelmistotuotanto" at University of Helsinki in fall 2023.

Here is a link to our app:
[Application](https://miniprojekti3.fly.dev/)

## Setting up the project locally:

Get the source code, clone the project.

The project uses PostgreSQL. It can be installed from documents/resources/local-pg-master-folder.
It contains using the script "pg-install.sh" and instructions in its own "README.md".

The ".env"-file should NOT be added to git.

Create a file named ".env" to "src"-folder with following contents
(your_db_name and your_secret_key can be chosen freely at this point):
>DATABASE_URL="postgresql:///your_db_name"
>SECRET_KEY="your_secret_key"

Install project dependencies with Poetry:
> poetry install --no-root

Define database tables from schema.sql in "src"-folder:
> psql (database_name) < schema.sql

## Running the project locally:

Start the virtual environment and shell:
> poetry shell

Go to "src"-folder:
> cd src

Run the Flask application:
> production=local flask run

Open the flask-webpage with your browser (Usual URL is http://127.0.0.1:5000).

Flask application can be stopped in terminal py pressing:
> ctrl+c

Shell can be exited with a command:
> exit

## Running tests locally:
### Unittest:
Start the virtual environment and shell:
> poetry shell

Go to "src"-folder:
> cd src

Open a new terminal and get database connection:
> start-pg.sh

Open a new terminal and create a new database for test:
> psql
>
> CREATE DATABASE test;
> 
> \c test

Define database tables from schema.sql in "src"-folder:
> psql test < schema.sql

Now run the tests in src-folder:
> production=local_test pytest

### Acceptance criteria using Robot Framework:
Start the virtual environment and shell:
> poetry shell

open a new terminal and get database connection:
> start-pg.sh

Run the Flask application in the "src"-folder in a new terminal:
> production=local_test flask run

Run robot tests in the "src"-folder in another terminal:
> robot tests/


## Documentation
- [Työaikakirjanpito & Sprint Backlog](https://docs.google.com/spreadsheets/d/1tvDweyWHiYNj0rdVt22RT_IMBiqbW4Og1WdRkrPofMc/edit?usp=sharing)
- [Definition of Done](https://github.com/ValioEilax/miniprojekti3/blob/main/documents/dod.md)
- [Product Backlog](https://github.com/users/ValioEilax/projects/1/views/1?layout=table)
- [Retro](https://github.com/ValioEilax/miniprojekti3/blob/main/documents/retro.md)
- [Report](documents/Miniprojektin loppuraportti.pdf)
