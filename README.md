# FunctionModule

[![Build Status](https://travis-ci.org/jkr2255/function_module.svg?branch=master)](https://travis-ci.org/jkr2255/function_module)

Ruby's module functions are really a combination of private method and public singleton method.
This gem offers some utility methods for manipulating module functions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'function_module'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install function_module

## Usage

### `Module#module_functions` (public)
Returns `Array` of `Symbol` with names of module functions
(both private instance method and public singleton method are defined).

Note:

* It doesn't check method definition; even if private instance method and public singleton method are different, it is counted as module function.
* methods in `Module` itself are excluded (`Module.new.module_functions` return empty `Aryay`)

### `Module#include_module_functions(mod)` (private)
Using `include_module_functions another_mod` in some module,

* include `another_mod` as usual.
* extend `another_mod` and make module functions public (usable for singleton methods)

### `Module#alias_module_function(new_name, old_name)` (private)
Make alias of module functions. In `alias`/`alias_method`, only instance method is aliased.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jkr2255/function_module.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

