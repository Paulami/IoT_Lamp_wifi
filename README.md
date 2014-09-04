# The Ping Project

## API

##### GET /
Returns the degrees to turn, based on the last ping timestamp.


##### GET /ping
saves timestamp


### Requirements

* Download and install Heroku Toolbelt - https://toolbelt.heroku.com

* Ruby (2.1.2)


### Local setup

```
cd the-ping-project
bundle install
rackup
```

Now visit `http://localhost:9292` to get the degrees to turn.

After making changes in local git repo, push to heroku with `git push heroku master`.

### Development log

```
mkdir the-ping-project
# create all the required files

# Create git repo and add files
git init
git add .
git commit -m "First commit"

heroku apps:create --app the-ping-project

# Set timezone to India
heroku config:add TZ='Asia/Kolkata'

# Push to heroku
git push heroku master
```
