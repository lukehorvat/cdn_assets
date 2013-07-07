# cdn_assets

Easily include popular CDN assets (e.g. jQuery, Twitter Bootstrap, Font Awesome, etc.) in your Ruby on Rails application.

This gem can definitely be used as a long-term solution if you're okay with the risks associated with having your assets served by a third party, but it's probably much more suited to those times when you just need to put something together *quickly* without hassle.

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

Anywhere in a view file (e.g. the `<head>` of application.html.erb), use the `cdn_asset` function to include a single CDN asset. Example:

```ruby
cdn_asset :jquery, v: '1.10.1', c: :google
```

Which produces the following output:

```html
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
```

As can be seen, the first argument to the function is the asset name, and the second is a hash of options containing the version (`v`) and the CDN (`c`) to serve it from. The options hash can also contain anything you would normally pass to a `javascript_include_tag` or a `stylesheet_link_tag`.

You can call the function as many times as you want, but if you want to include **multiple** assets in the same view, then a better way is to pass a hash to the `cdn_assets` (plural) function. Example:

```ruby
cdn_assets bootstrap: { v: '2.3.2', c: :cdnjs }, font_awesome: { v: '3.2.1', c: :netdna }
```

## Supported Assets & CDNs

Below is a matrix showing the assets and CDNs currently supported by this gem, ordered alphabetically. Use the exact names listed here as symbols or strings in your code.

|                                | **cdnjs** | **google** | **microsoft** | **netdna** |
|:-------------------------------|:---------:|:----------:|:-------------:|:----------:|
| **bootstrap**                  | :+1:      |            |               |            |
| **bootstrap_js**               | :+1:      |            |               | :+1:       |
| **bootstrap_responsive**       | :+1:      |            |               | :+1:       |
| **bootstrap_responsive_icons** |           |            |               | :+1:       |
| **font_awesome**               |           |            |               | :+1:       |
| **jquery**                     | :+1:      | :+1:       | :+1:          |            |
