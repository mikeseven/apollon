# apollon

Vagrant box containing lot of tools and libs for data science

## Status

[![Gem Version](https://badge.fury.io/rb/apollon.png)](http://badge.fury.io/rb/apollon)
[![Dependency Status](https://gemnasium.com/korczis/apollon.png)](https://gemnasium.com/korczis/apollon)
[![Code Climate](https://codeclimate.com/github/korczis/apollon.png)](https://codeclimate.com/github/korczis/apollon)
[![Build Status](https://travis-ci.org/korczis/apollon.png)](https://travis-ci.org/korczis/apollon)
[![Coverage Status](https://coveralls.io/repos/korczis/apollon/badge.png?branch=master)](https://coveralls.io/r/korczis/apollon?branch=master)

## About

What is this heavy-weight box for? For super-quick prototyping. 

Yes. You know what.

1. You got an idea. You want to immediately start working on it. 
2. You realize you need to setup development environment with all the tools and stuff.

That is what this fat boy is here for.
It can be made up and running with [few commands](https://github.com/korczis/apollon#getting-started).

## What is included

Lot of useful stuff, for full list see [WHATS_IN.md](https://github.com/korczis/apollon/blob/master/WHATS_IN.md)

- Databases - couchdb, memcached, mongodb, postgresql, redis, ...
- Programming Languages - c, c++, clojure, node.js, ruby/rvm, scala, ...
- Tools - mocha, ...

Again, for full list see [WHATS_IN.md](https://github.com/korczis/apollon/blob/master/WHATS_IN.md)

## Automagically forwarded services

This lists services which are automatically forwarded from running fat box to localhost.

That means that you can access them using [http://localhost:{HostPortNumer}](http://localhost:{HostPortNumer}) from table below.

| Service       | Guest  | Host                            | Username | Password |
| --------------|:------:|:-------------------------------:|:--------:|:--------:|
| SSH           | 22     | [2222](ssh://localhost:2222)    | vagrant  | vagrant  |
| Nginx         | 80     | [81](http://localhost:81)       | n/a      | n/a      |
| Zookeeper     | 2181   | 2182                            | n/a      | n/a      |
| PostgreSQL    | 5432   | 5433                            | vagrant  | vagrant  |
| CouchDB       | 5984   | [5985](http://localhost:5985)   | n/a      | n/a      |
| Redis         | 6379   | 6380                            | n/a      | n/a      |
| Tomcat7       | 8080   | [8081](http://localhost:8081)   | vagrant  | vagrant  |
| ElasticSearch | 9200   | [9201](http://localhost:9201)   | n/a      | n/a      |
| Memcached     | 11211  | 11212                           | n/a      | n/a      |
| RabbitMQ      | 15672  | [15673](http://localhost:15673) | guest    | guest    |
| MongoDB       | 27017  | [27018](http://localhost:27018) | n/a      | n/a      |
| MongoDB Rest  | 28017  | [28018](http://localhost:28018) | n/a      | n/a      |

## Getting Started

### Prerequisites

- [Ruby](https://www.ruby-lang.org/en/)
- [Ruby gems](https://rubygems.org/pages/download)
- [Bundler](http://bundler.io/)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

### Installation

#### curl - Bash script

```
\curl -sSL https://gist.githubusercontent.com/korczis/22667ca5e732c6fb29bd/raw/prepare-for-apollon.sh | sudo bash
```

#### wget - Bash script

```
wget -O - https://gist.githubusercontent.com/korczis/22667ca5e732c6fb29bd/raw/prepare-for-apollon.sh | bash
```

#### Git sources

```
# Clone this repo containging Vagrantfile with vagrant settings
git clone https://github.com/korczis/apollon.git

# Enter the folder with Vagrantfile, be aware of trailing box folder in path!
cd apollon

# Kick off the vagrant up process
vagrant up
```

Example output of succesful launch can be found [here](https://gist.github.com/korczis/4789d566361b095f2e73).

## Logging in

For loggining-in use vagrant ssh.

```
vagrant ssh
```

## Destroying instance 

Destroy instance using vagrant destroy.

```
vagrant destroy
```

## Changelog

For full changelog see [CHANGELOG.md](https://github.com/korczis/apollon/blob/master/CHANGELOG.md)

## TODO

For list of TODO stuff see [TODO.md](https://github.com/korczis/apollon/blob/master/TODO.md)

## Credits

- [@pavelbinar](https://github.com/pavelbinar) for QA and not just that.
- [@thnkr](https://github.com/thnkr/) for ideas, encouragement and other.
