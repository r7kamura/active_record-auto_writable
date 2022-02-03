# ActiveRecord::AutoWritable

[![test](https://github.com/r7kamura/active_record-auto_writable/actions/workflows/test.yml/badge.svg)](https://github.com/r7kamura/active_record-auto_writable/actions/workflows/test.yml)

Automatically switch to writable role on ActiverRecord writable methods.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_record-auto_writable'
```

And then execute:

```
bundle install
```

Or install it yourself as:

```
gem install active_record-auto_writable
```

## Usage

Just install and it works.

### Configuration

By default, it wraps all ActiveRecord write methods by `ActiveRecord::Base.conneted_to(role: :writing) { ... }`.
If you want to modify this behavior, set a custom Proc to `ActiveRecord::AutoWritable.configuration.proxy`.

```ruby
ActiveRecord::AutoWritable.configuration.proxy = lambda do |&block|
  AnimalRecord.connected_to(role: :zoo_keeper, &block)
end
```
