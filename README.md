Flippr
================

Flippr is a Frontend Performance Monitoring tool.

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
- **database.yml**, **secrets.yml** config files are ignored from the version control and a new developer is expected to obtain it from an existing developer or from any of the server instances.

Branch History
--------------

- **master** is the stable release branch, which is used to maintain the *production ready codebase*.

- **release** is the edge release branch, which is primarily used to maintain the *staging ready codebase*.
- **develop** is the integration branch.

To know more about branch structure read the instructions in the [contributor guidelines](CONTRIBUTING.md).

Deployment details
------------------

**Capistrano v3** is being used as the deployment automation tool.

Changes need to go to the develop branch first to be deployed to the staging instance. After testing and approval, develop branch needs to be merged with the master branch for production deployment.

Staging server details
----------------------

- **IP:**

- **Username:**

- **Branch:** develop


Production server details
-------------------------

- **IP:**

- **Username:**

- **Branch:** master