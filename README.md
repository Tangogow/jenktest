# Flask - Flaskr

Simple *Hello World* Flask template.

## Table of content

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Test Coverage](#test-coverage)
- [Production](#production)
- [Known Problems](#known-problems)

## Description

test

[Official Flask Tutorial](https://flask.palletsprojects.com/en/1.1.x/tutorial)

## Installation

```bash
pip3 install -e .
```

## Usage

#### Local

```bash
export FLASK_APP=flaskr.py #path
export FLASK_ENV=development 
flask run
```
Go to [http://localhost:5000](http://localhost:5000)

#### Dockerized

```bash
export FLASK_APP=flaskr.py #path
export FLASK_ENV=development 
flask run -h 0.0.0.0
```
Go to [http://< yourContainerIP >:5000](http://172.17.0.2:5000)

#### Optionnal: Virtual env setup (for dev or prod purpose)

```bash
mkdir myproject
cd myproject
python3 -m venv venv
. venv/bin/activate
pip3 install flask
```

## Test Coverage

```bash
pip3 install pytest coverage
pytest | python3 -m pytest # pytest may fail (because of sys path)
```

## Production

#### Local
```bash
pip3 install wheel waitress
python3 setup.py bdist_wheel
pip3 install build/flaskr*.whl
sed -i "s/secretKeyToReplace/$(python -c 'import os; print(os.urandom(16))')/g" flaskr/__init__.py
export FLASK_ENV="production" # override FLASK_DEBUG
# Remove debug and port app parameters if set
waitress-serve --call 'flaskr:create_app'
```
Go to [http://localhost:8080](http://localhost:8080)

## Known problems 

Flask app varenv extension:
```bash
export FLASK_APP=flaskr
```
Can trigger an error depending on which file/module you're calling, or how your flask project is designed, try adding/removing the `.py` extension.
