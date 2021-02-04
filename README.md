# Instructions

1. Set up your AWS Cloud9 environment first. Instructions are below. Video is on Canvas.
2. Fork this repo to your own GitHub account. Otherwise you can't push.
3. Clone your fork to Cloud9 and complete your homework in the main branch or a development branch.
4. Push your homework changes back to your fork on GitHub, merging into main if necessary.
5. Open a pull request to mverdicchio/421-reading-log to submit your homework
6. Post the link to your PR on Canvas to submit.

# AWS Cloud9 Setup

Follow the video of my setup. In the video you will see the following actions (with approximate time stamps).
* (00:00) Create a new environment with t2.micro and Ubuntu Server 18.04
* (00:35) Create and run the [resizing script from AWS](https://docs.aws.amazon.com/cloud9/latest/user-guide/move-environment.html#move-environment-resize). This will increase the amount of storage you have behind your C9 instance. Some of the libraries we install take up extra space and it can run out.
* (01:53) Install postgres and a dependency. We will use this database instead of sqlite3. Here's the command:
  * `sudo apt-get install postgresql postgresql-contrib libpq-dev`
* (03:23) Clone your fork into C9 (do not clone my repo -- so you will use your own remote URL).
  * Don't forget to change directories into the project root.
* (03:36) Run `bundle install`, which will install all required gems listed in `Gemfile`.
* (04:18) Install `figaro`, which will generate `config/application.yml` locally.
* (04:47) Edit `config/appication.yml` with the environment variables (database username and password) EXACTLY as shown.
  * `PG_USER: "pg-user"
  * `PG_PASS: "pg-pass123"
  * These must be consistent with `config/database.yml`.
* (05:10) Set up the database user for your environment as shown in the next section.

## postgres setup

The postgres username and password is in `config/application.yml`, which is a file created by Figaro. This file is generated just for your development environment, but is never checked into version control. Otherwise outside people would have your credentials. The user we set is `pg-user`, so replace that in the commands below if you changed it.
Now you must give that user permissions to create the db. This must be done on every local machine (dev environment).

```
$ sudo -u postgres createuser -s pg-user
$ sudo -u postgres createdb pg-user
```

Now that user needs permission to migrate the database. Do this:
```
$ sudo su postgres
postgres $ psql
postgres=# ALTER USER "pg-user" WITH SUPERUSER;
postgres=# \q
exit
```

Finally, that user needs a password, and that password must be the same one you defined in `config/application.yml`. Set it like this:

```
$ sudo -u postgres psql
postgres=# \password pg-user
Enter new password: 
Enter it again: 
postgres=# \q
$
```

# AWS Cloud9 Setup (continued)

* (07:23) Now you can run `bin/rails db:create db:migrate` since your local dev environment has a user with permission to create the database.
* (07:43) Install and run Yarn to avoid stupid problems with webpacker:
```
$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
$ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
$ sudo apt update && sudo apt install yarn
$ bin/yarn install
$ bin/rails webpacker:install
$ bin/rails webpacker:install:vue
```

* (09:14) Run the app: `bin/rails s -b 0.0.0.0` and preview.
 
