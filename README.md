# lita-tell
[![Code Climate](https://codeclimate.com/github/charly-palencia/lita-tell/badges/gpa.svg)](https://codeclimate.com/github/charly-palencia/lita-tell)

[![Build Status](https://travis-ci.org/charly-palencia/lita-tell.svg?branch=master)](https://travis-ci.org/charly-palencia/lita-tell)

[![Coverage Status](https://coveralls.io/repos/charly-palencia/lita-tell/badge.svg?branch=master&service=github)](https://coveralls.io/github/charly-palencia/lita-tell?branch=master)

Lita plugin to send a message to a specific user or  room

## Installation

Add lita-tell to your Lita instance's Gemfile:

``` ruby
gem "lita-tell"
```


## Usage

``` shell
lita tell "message" to [user|room]
```

## Example

``` shell
lita tell "message" to jhon_doe

lita tell "message" to project_one
```
