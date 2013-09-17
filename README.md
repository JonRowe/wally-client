# Wally Client
Wally is a web-based Cucumber viewer and navigator, this is a client for it.

## Installation
* Install and configure somewhere [wally](/BBCNews/wally) and ensure it is running
* ```gem install wally-client```

## Usage
* create a '.wally' file and enter any authentication text you like (```echo myPassword > .wally```)

## Creating / Updating projects
```wally push http://localhost:4567/projects/<project-name> <feature-dir>```

## Deleting projects
```wally destroy http://example.com/projects/<project-name>```
