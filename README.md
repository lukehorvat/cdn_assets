# cdn_assets

Easily include popular CDN assets (e.g. jQuery, Twitter Bootstrap, Font Awesome, etc.) in your Ruby on Rails application.

This gem can definitely be used as a long-term solution if you're okay with the risks associated with having your assets served by a third party, but it's probably much more suited to those times when you just need to put something together *quickly* without hassle. Some example scenarios:

 * You need to rapidly prototype or demo something for your boss/client ASAP.
 * You read some blog post about how you can do X with Twitter Bootstrap and now you want to try for yourself.
 * Hackathons. _\*shudder*_

## Installation

Add this line to your application's *Gemfile*:

```ruby
gem 'cdn_assets'
```

And then execute:

```bash
$ bundle install
```

## Usage

Anywhere in a view file (e.g. the `<head>` of application.html.erb), use the `include_cdn_asset` function to include a single CDN asset. Example:

```ruby
include_cdn_asset :jquery, { v: '1.8.2', c: :google }
```

As can be seen, the first argument is the asset name, and the second is a hash of options containing the version (`v`) and the CDN to serve it from (`c`).

You can call that function as many times as you want. But a better way to include **multiple** assets in the same view is to pass a hash to the `include_cdn_assets` (plural) function. Example:

```ruby
include_cdn_assets bootstrap_css: { v: '2.3.2', c: :netdna }, font_awesome: { v: '3.2.1', c: :cdnjs }
```

That's it.
