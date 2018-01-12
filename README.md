# Avatari

[![Gem Version](https://badge.fury.io/rb/avatari.svg)](https://badge.fury.io/rb/avatari) <img src="https://travis-ci.org/jonhue/avatari.svg?branch=master" />

Avatari extends [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) to make adding avatars to ActiveRecord models super simple.

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
    * [CarrierWave](#carrierwave)
    * [Models](#models)
    * [Views](#views)
* [Configuration](#configuration)
* [To Do](#to-do)
* [Contributing](#contributing)
    * [Contributors](#contributors)
    * [Semantic versioning](#semantic-versioning)
* [License](#license)

---

## Installation

Avatari works with Rails 5 onwards. You can add it to your `Gemfile` with:

```ruby
gem 'avatari'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install avatari

If you always want to be up to date fetch the latest from GitHub in your `Gemfile`:

```ruby
gem 'avatari', github: 'jonhue/avatari'
```

Now run the generator:

    $ rails g avatari

Add the stylesheet to the asset pipeline:

```
/*
 *= require avatari
 */
```

---

## Usage

### CarrierWave

To backup CarrierWave add an `avatar` column (`string`) to every ActiveRecord model's database table you are using Avatari on.

The `avatar` attribute can be used like any other CarrierWave instance.

Avatari makes some assumptions about your CarrierWave integration. For Avatari to work properly after installation, [Fog](https://github.com/carrierwaveuploader/carrierwave#fog) and [MiniMagick](https://github.com/minimagick/minimagick) have to be set up. However they can be unrequired when [configuring](#configuration) Avatari.

Avatari preprocesses uploaded avatars by default:

* `raw` (800x800)
* `big` (350x350)
* `medium` (100x100)
* `small` (75x75)
* `tiny` (50x50)
* `mini` (40x40)

### Models

You can add Avatari to an ActiveRecord model:

```ruby
class User < ApplicationRecord
    avatari
end
```

You can also pass an `initials` option, which specifies an attribute or instance method that returns initials used for placeholder avatars if no custom avatar has been uploaded yet:

```ruby
class User < ApplicationRecord
    avatari :initials

    def initials
        [self.first_name, self.last_name].join(' ')
    end
end
```

By default Avatari manipulates the passed initials: only the first characters of the first two word will be used as initials:

```
'Jonas Hübotter'
=> 'JH'
'jonas hübotter'
=> 'JH'
'jonas hübotter and someone else'
=> 'JH'
```

**Note:** When [rendering](#views) an avatar and you did not provide the `initials` option + no avatar has been uploaded yet, the helper method will return `false`.

To add custom background colors to your placeholder avatars, pass the `colors` option:

```ruby
class User < ApplicationRecord
    avatari colors: ['#000000', '#333333']
end
```

For every instance of the class, Avatari will pick a sample of the array of provided background colors. The default for every instance is `#000000`.

To attach a picked color to a given record permanently, you will also have to add an `avatar_color` string column to your database tables.

There is a variety of other options you can pass to further configure Avatari. Here are the defaults:

```ruby
class User < ApplicationRecord
    avatari colors: ['#000000'], versions: {
        mini: [40,40],
        tiny: [50,50],
        small: [75,75],
        medium: [100,100],
        big: [350,350],
        raw: [800,800]
    }, default_version: nil, process: [800,800], extension_whitelist: ['jpg','jpeg','png']
end
```

### Views

To render an avatar in your view, utilize the `avatari` helper method:

```haml
= component 'avatari/avatar', object: current_user
```

You can also specify a size:

```haml
= component 'avatari/avatar', object: current_user, version: :tiny
```

You are able to check whether or not an avatar can be rendered:

```haml
- if avatari? current_user
    = component 'avatari/avatar', object: current_user
```

---

## Configuration

You can configure Avatari by passing a block to `configure`. This can be done in `config/initializers/avatari.rb`:

```ruby
Avatari.configure do |config|
    config.default_version = :medium
end
```

**`default_version`** Default version to be used when rendering avatars. Takes a symbol. Defaults to `:medium`.

**`mini_magick`** Whether or not to include MiniMagick. Required for processing file versions. Takes a boolean. Defaults to `true`.

**`storage`** Choose you default storage option for CarrierWave. Accepts `:file` or `:fog`. Defaults to `:fog`.

---

## To Do

[Here](https://github.com/jonhue/avatari/projects/1) is the full list of current projects.

To propose your ideas, initiate the discussion by adding a [new issue](https://github.com/jonhue/avatari/issues/new).

---

## Contributing

We hope that you will consider contributing to Avatari. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](CONTRIBUTING.md), [Code of Conduct](CODE_OF_CONDUCT.md)

### Contributors

Give the people some :heart: who are working on this project. See them all at:

https://github.com/jonhue/avatari/graphs/contributors

### Semantic Versioning

Avatari follows Semantic Versioning 2.0 as defined at http://semver.org.

## License

MIT License

Copyright (c) 2017 Jonas Hübotter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
