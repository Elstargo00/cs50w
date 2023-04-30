from flask import Flask, render_template, request, session
from flask_session import Session

import datetime

app = Flask(__name__)

app.debug = False
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)



@app.route("/")
def index():
    return render_template("index.html", headline="Index Page")


@app.route("/david")
def david():
    return "Hello, David"


# @app.route("/<string:name>")
# def anyname(name):
#     name = name.capitalize()
#     return f"<h1>Hello, {name}<h1>"


@app.route("/variables0")
def variables0():
    headline = "Hello, world!"
    return render_template("index.html", headline=headline)


@app.route("/conditions")
def conditions():
    now = datetime.datetime.now()
    new_year = (now.month == 1 and now.day == 1)
    return render_template("index.html", headline="Is it new year?", new_year=new_year)


@app.route("/loops")
def loops():
    names = ["Alice", "Bob", "Charlie"]
    return render_template("index.html", names=names)


@app.route("/urls")
def more():
    return render_template("more.html", headline="urls example")

@app.route("/forms", methods=["POST"])
def forms():
    name = request.form.get("name")
    return render_template("hello.html", name=name)


# notes = []

@app.route("/notes", methods=["GET", "POST"])
def _notes():
    if session.get("notes") is None:
        session["notes"] = []
    if request.method == "POST":
        note = request.form.get("note")
        session["notes"].append(note)

    return render_template("notes.html", notes=session["notes"])