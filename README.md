## Bookmark Manager ##

A web app to store bookmarks for popular websites

### Getting started ###
`git clone git@github.com:Benjamaker/bookmark-manager.git`

Then run `bundle`

### To set up the database ###

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the datatbase in `psql` and run the SQL scripts in the `db/migrations` directory in the given folder.

### To run tests ###
`rspec` from the parent directory
