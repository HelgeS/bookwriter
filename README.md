# Bookwriter

[![Build Status](https://travis-ci.org/team-sb/bookwriter.svg?branch=master)](https://travis-ci.org/team-sb/bookwriter)

This is the bookwriter project of Team SB for the Web Engineering course at H-BRS, Germany.

Bookwriter is a collaborative cloud-service for book writing.

Running versions can be accessed via:

- Testing version: http://testing-bookwriter.rhcloud.com/
- Stable version: http://stable-bookwriter.rhcloud.com/

## How to install?

The project consists of a RubyMine project environment, which you can directly clone from GitHub out of the IDE.

A few further steps have to be done to run the project:
1. Copy the file 'config/initializers/secret_token.rb.example' to 'config/initializers/secret_token.rb' and change the secret token, if wanted.
2. Adjust the database.yml. Without changes it tries to connect to a locally running postgresql database, but there is also an example for a sqlite3 database alternative. 

### Deploy to Heroku
You can deploy this project directly to Heroku:
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)