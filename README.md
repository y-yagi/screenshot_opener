# ScreenshotOpener

[![Build Status](https://travis-ci.org/y-yagi/screenshot_opener.svg?branch=master)](https://travis-ci.org/y-yagi/screenshot_opener)
[![Gem Version](https://badge.fury.io/rb/screenshot_opener.svg)](http://badge.fury.io/rb/screenshot_opener)

Automatically open a screenshot when System Test fails.

Rails' System Test gets screenshots automatically when the test fails and displays it on the terminal. However, its display is premised on iTerm, it will not be displayed on other terminals.

`ScreenshotOpener` should open a screenshot instead of displaying it on terminal.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'screenshot_opener'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install screenshot_opener

## Usage

By default, it tries to open a file using `xdg-open`, `gnome-open`, or `open` commands. If you want to use other commands, please set as follows.

```ruby
ScreenshotOpener.command = "xxx" # Specify command that you want to use.
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/y-yagi/screenshot_opener. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ScreenshotOpener project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/screenshot_opener/blob/master/CODE_OF_CONDUCT.md).
