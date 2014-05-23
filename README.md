# Reporter

This is a RubyGem for reading and modifying [Reporter](http://www.reporter-app.com/) reports and snapshots. Based on the [description of Reporter's export data](https://gist.github.com/dbreunig/9315705).

## Installation

Add this line to your application's Gemfile:

    gem 'reporter-ruby', github: 'eturk/reporter-ruby'

And then execute:

    $ bundle

## Usage

Currently, you can read the snapshots from the JSON exports.

```ruby
require 'reporter'

reporter = Reporter::Client.new(Dir.glob('/Users/ethan/Dropbox/Apps/Reporter-App/*-export.json'))
reporter.snapshots # => [ #<Reporter::Snapshot>, #<Reporter::Snapshot> ]

reporter.snapshots.first.battery # => 0.95

response = reporter.snapshots.first.responses # => [ #<Reporter::Response>, #<Reporter::Response> ]
response.first.questionPrompt # => "What are you doing?"
response.first.tokens # => [ "Eating" ]
```

In the future, you'll be able to query for results for certain criteria.

```ruby
reporter.responses.where(questionPrompt: 'What are you doing?') # => [ #<Reporter::Response>, #<Reporter::Response> ]
```

## Contributing

1. Fork it (https://github.com/eturk/reporter/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
