# Avatari

[![Gem Version](https://badge.fury.io/rb/avatari.svg)](https://badge.fury.io/rb/avatari) <img src="https://travis-ci.org/jonhue/avatari.svg?branch=master" />

Avatari extends [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) to make adding avatars to ActiveRecord models super simple.

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
    * [Assets](#assets)
    * [CarrierWave](#carrierwave)
    * [Models](#models)
    * [Views](#views)
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

## Usage

### Assets

To render Avatari avatars, you have to require the necessary assets to be added to your asset pipeline:

```js
//= require avitari
```

```css
/*
 *= require avitari.min
 */
```

**Note:** You can override the [styles](vendor/assets/stylesheets/avatari.sass) when you are looking for a custom integration.

### CarrierWave

To backup CarrierWave add an `avatar` column (`string`) to every ActiveRecord model's database table you are using Avatari on.

The `avatar` attribute can be used like any other CarrierWave instance.

Avatari makes some assumptions about your CarrierWave integration. For Avatari to work properly, [Fog](https://github.com/carrierwaveuploader/carrierwave#fog) and [MiniMagick](https://github.com/minimagick/minimagick) have to be set up.

Avatari preprocesses uploaded avatars:

* `raw` (800x800)
* `big` (350x350)
* `medium` (100x100)
* `small` (75x75)
* `tiny` (50x50)
* `mini` (40x40)

It accepts images in `jpg`, `jpeg` and `png` format.

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
        self.first_name[0] + self.last_name[0]
    end
end
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

### Views

To render an avatar in your view, utilize the `avatari` helper method:

```haml
= avatari current_user
```

You can also specify a size:

```haml
= avatari current_user, :tiny
```

The `size` of the rendered avatar defaults to `:medium`.

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
