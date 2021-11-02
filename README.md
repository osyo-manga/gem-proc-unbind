# Proc::Unbind

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'proc-unbind'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install proc-unbind

## Usage

```ruby
require "proc/unbind"

using Proc::Unbind

class X
	attr_accessor :value
end


disp = proc {
	p self
	p @value
}
disp.call
#=> main
#=> nil

# Return UnboundMethod
disp.unbind


# Bind X object
x = X.new
x.value = 42
disp_ = disp.unbind.bind x

# Receiver is X object
disp_.call
#=> #<X:0x000000014313f8 @value=42>
#=> 42
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/osyo-manga/gem-proc-unbind.

