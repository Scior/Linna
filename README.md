# Linna

[![version](https://img.shields.io/badge/version-alpha-lightgrey.svg)](https://github.com/Scior/Linna)
[![Build Status](https://travis-ci.org/Scior/Linna.svg?branch=master)](https://travis-ci.org/Scior/Linna)
[![Swift: 4.2](https://img.shields.io/badge/Swift-4.2-green.svg)](https://swift.org/)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![Coverage Status](https://coveralls.io/repos/github/Scior/Linna/badge.svg)](https://coveralls.io/github/Scior/Linna)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

----

## What's this?

Linna is a simple customizable logger for iOS, fully compatible with Swift.  

## Installation

### With Carthage

- Add the following line to `Cartfile`.

```ruby
github "Scior/Linna"
```

- Run `carthage install`.

- Add `Linna.framework` to your project.

![Framework Installation](./docs/images/framework_installation.png)

## Usage

- Import from the source file and simply call the methods.

```swift
import Linna

func someFunc() {
    // Sample for the console output with the default format
    Linna.cout("Hello!")
}
```
