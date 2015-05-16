Flippr
================

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.1
- Rails 4.2.1

Getting Started
---------------

### Clone the repo
```
#!ruby

git@github.com:geniitech/flippr.git
```

### Install all the required gems
```
#!ruby

bundle install
```

### Create & Migrate the database
```
#!ruby

rake db:create
rake db:migrate
```

### Cautions
- **database.yml**, **secrets.yml** config files are ignore from the version control and a new developer is expected to obtain it from an existing developer or from any of the server instances.

Branch History
--------------

**master** is the stable release branch, which is used to maintain the *production ready codebase*.

**staging** is the edge release branch, which is primarily used to maintain the *staging ready codebase*.

**name** branches are for individual developers, who are supposed to push a final commit for the day for the code manager to do a day end merge push to the staging branch.

Deployment details
------------------

**Capistrano v3** is being used as the deployment automation tool.

Changes need to go to the staging branch first to be deployed to the staging instance. After testing and approval, staging branch needs to be merged with the master branch for production deployment.

Staging server details
----------------------

- **IP:** 

- **Username:** 

- **Branch:** staging


Production server details
-------------------------

- **IP:** 

- **Username:** 

- **Branch:** master

