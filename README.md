# WorkingScholar

WorkingScholar is a micro-consulting platform that empowers students to
build their professional experience.

## Features

- Job board
- Rating system
- Searching

## Contributing

Want to contribute to WorkingScholar?  We welcome
[pull requests](https://github.com/WorkingScholar/workingscholar/pulls)!

### Requirements

We use [PostgreSQL](http://www.postgresql.org/) as our datastore.

On OS X, install PostgreSQL through [Homebrew](http://brew.sh/):

```sh
brew upgrade && brew update && brew cleanup
brew install postgresql
```

Create the necessary databases (usually `development`):

```
createdb WorkingScholar_ENVIRONMENT
```

where ENVIRONMENT is one of `development`, `test`, `production`.

> **Note**: the database name __**is**__ case-sensitive.

### Installation & Setup

Install the application dependencies with:

```sh
bundle install --path vendor
```

### Running the Application

Start the application server with:

```sh
bundle exec rails server
```

Navigate to [http://localhost:3000](http://localhost:3000) and start hacking on the code.

## License

Copyright (c) 2015 Working Scholar.  All rights reserved.
