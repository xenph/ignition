# Ignition

In the simplest of terms, Ignition is a very basic crowd funding web application — a la Kickstarter. It allows users to create projects, for which others can vote on or pledge time to. It was written for managing internal projects at [BigCommerce](http://www.bigcommerce.com). 

![Ignition Interface](https://p.twimg.com/ArycIJ8CQAE-F_O.png)

## Why would I want to use it?

Ignition is useful for companies or teams with 20% time, or another variant on the undirected employee time.

Ignition allows employees to find projects that they are interested in helping come to fruition. Through an open source communication model it facilitates co-operation without the need for central management.

## How do I install it?

### Prerequisites

To install Ignition you'll need the following tools;

* [Git](http://git-scm.com/)
* [Ruby 1.9.2+](http://www.ruby-lang.org/en/)
* [Rails 3.2+](http://rubyonrails.org/)
* [Bundler](http://gembundler.com/)

### Running locally

Ignition runs under the WebBrick server that comes as part of rails. If you are planning to use it for production, you'll want to use something like [Thin](http://code.macournoyer.com/thin/) instead.

    $ git clone git@github.com:xenph/ignition.git
    $ cd ignition
    $ bundle install
    $ rake db:migrate
    $ rails server

### Running on Heroku

The [Heroku](http://heroku.com) documentation has a very good entry on [setting up a Rails 3 application](https://devcenter.heroku.com/articles/rails3), but the basics are as follows;

    $ git clone git@github.com:xenph/ignition.git
    $ cd ignition
    $ gem install heroku
    $ heroku login
    $ bundle install
    $ heroku create --stack cedar
    $ git push heroku master

## Contribute

We'd love for you to contribute to Ignition! Just fork the code, make your change and submit a pull request.

## Ignition

The original idea for Ignition came from [Ajeya](http://www.github.com/ajeya), and was lovingly hand crafted by [Chris Beckett](http://www.twitter.com/chris_beckett) & [Mark Rickerby](http://www.twitter.com/maetl).

##License
© 2013 Philip Muir. All rights reserved.
