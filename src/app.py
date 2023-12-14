from os import getenv
from flask import Flask
from flask_bootstrap import Bootstrap
from db import db


app = Flask(__name__)

if getenv("production") == "test":
    DB_ADDRESS = "postgresql://test:test@localhost:5432"
elif getenv("production") == "local_test":
    DB_ADDRESS = "postgresql:///test"
elif getenv("production") == "local":
    DB_ADDRESS = getenv("DATABASE_URL")
else:
    DB_ADDRESS = getenv("DATABASE_URL").replace("://", "ql://", 1)

app.config["SQLALCHEMY_DATABASE_URI"] = DB_ADDRESS

app.secret_key = getenv("SECRET_KEY")

Bootstrap(app)
db.init_app(app)
app.app_context().push()

import routes
