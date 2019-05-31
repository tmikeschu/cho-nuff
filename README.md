# cho-nuff

A handy app for assigning and managing shared household chores. Can your house
work together to stay tidy? Cho-nuff!

![](https://media.giphy.com/media/3DnDRfZe2ubQc/giphy.gif)

## Data

A user has many houses
A house has many rooms
A room has many tasks
A user has many user tasks that can be completed

## Setup

Fork and clone the repo:

```shell
git clone git@github.com:<YOUR_USERNAME>/cho-nuff.git
```

Get your deps, db set, and run them tests:

```shell
yarn install
bundle install
bin/rails db:{create,migrate}
rspec
```

## Local Development

The one and only:

```shell
bin/rails server
```

To poke around with data:

```shell
bin/rails console
```

## Tools

### `standard`

Set up your editor to auto fix your code using the awesome gem [standard](https://github.com/testdouble/standard).
