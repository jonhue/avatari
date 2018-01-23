# Changelog

### master

* nothing yet

### 2.0.2 - 2018/01/23

* bugfixes
    * require Mozaic in `railtie.rb`

### 2.0.1 - 2018/01/12

* bugfixes
    * fixed `avatari?` view helper

### 2.0.0 - 2018/01/12

* features
    * add Mozaic gem

### 1.1.0 - 2018/01/08

* features
    * add generator with initializer to allow configuration of Avatari
    * introduce `Avatari::Avatar` instances associated with ActiveRecord classes
* enhancements
    * automatically fetch first letters from passed initials accessor
    * allow to override the default version for a specific class
    * customize image formats and preprocessed versions
    * unrequire Fog & MiniMagick
* bugfixes
    * fixed dependencies

### 1.0.0 - 2018/01/07

* initial release
