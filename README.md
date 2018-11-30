# Linna

[![version](https://img.shields.io/badge/version-alpha-lightgrey.svg)](https://github.com/Scior/Linna)
[![Build Status](https://travis-ci.org/Scior/Linna.svg?branch=master)](https://travis-ci.org/Scior/Linna)
[![Swift: 4.2](https://img.shields.io/badge/Swift-4.2-green.svg)](https://swift.org/)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![Coverage Status](https://coveralls.io/repos/github/Scior/Linna/badge.svg)](https://coveralls.io/github/Scior/Linna)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=Scior_Linna&metric=vulnerabilities)](https://sonarcloud.io/api/project_badges/measure?project=Scior_Linna&metric=vulnerabilities)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=Scior_Linna&metric=bugs)](https://sonarcloud.io/api/project_badges/measure?project=Scior_Linna&metric=bugs)

----

## What's this?

**Linna** is a simple customizable logger for iOS, fully compatible with Swift.  

## Installation

### With Carthage

- Add the following line to `Cartfile`.

```ruby
github "Scior/Linna"
```

- Run `carthage update`.

- Add `Linna.framework` to your project.

![Framework Installation](./docs/images/framework_installation.png)

## Usage

### Simplest way

Import **Linna** and simply call the methods.

```swift
import Linna

func someFunc() {
    // Sample for the console output with the default format
    Linna.cout("Hello!")
}
```

### With a customized format

Heres are replaced attributes.

- `%d`: Replaced with a date string.
- `%obj`: Replaced with objects.
- `%level`: Replaced with a log level.
- `%file`: Replaced with a file name.
- `%func`: Replaced with a function name.
- `%line`: Replaced with a line number.

A format pattern must be set before calling output methods.

```swift
Linna.setPattern(pattern: "%d %obj <%level> #%file:%func:%line#")
Linna.cout("Hello!")
```

## License

**Linna** is under MIT License.

Copyright (c) 2018 Suita Fujino  
