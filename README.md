# Linna

[![version](https://img.shields.io/badge/version-0.2.1-blue.svg)](https://github.com/Scior/Linna)
[![Build Status](https://travis-ci.org/Scior/Linna.svg?branch=master)](https://travis-ci.org/Scior/Linna)
[![Swift: 5.0](https://img.shields.io/badge/Swift-5.0-green.svg)](https://swift.org/)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![Coverage Status](https://coveralls.io/repos/github/Scior/Linna/badge.svg)](https://coveralls.io/github/Scior/Linna)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=Scior_Linna&metric=vulnerabilities)](https://sonarcloud.io/api/project_badges/measure?project=Scior_Linna&metric=vulnerabilities)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=Scior_Linna&metric=bugs)](https://sonarcloud.io/api/project_badges/measure?project=Scior_Linna&metric=bugs)

----

- [What's this?](#whats-this)
- [Feature](#feature)
- [Installation](#installation)
- [Usage](#usage)
- [Debugging with Terminal](#debugging-with-terminal)
- [Sample](#sample)
- [License](#license)

README written in other languages:

- [日本語(Japanese)](./README_ja.md)

## What's this?

**Linna** is a simple customizable logger for iOS, fully compatible with Swift.  

![Linna Sample](https://gist.githubusercontent.com/Scior/c601461a06a384e0f534b045d29b6272/raw/2b6c0ef488bf17fa38f9980ae2c77083ca795a6b/linnasample.gif)

### Feature

- Simple interface.
- Customizable formats.
- Support file output.
  - Files can be opened with a terminal:D
- Classification with tags.

## Installation

### With Carthage

- Add the following line to `Cartfile`.

```ruby
github "Scior/Linna"
```

- Run `carthage update`.

- Add `Linna.framework` to your project.

## Usage

### The simplest way

Import **Linna** and simply call the methods with shared instance.

```swift
import Linna

func someFunc() {
    // Sample for the console output with the default format
    Linna.shared.out("Hello!")
}
```

The console output will be,

```text
2018/12/01 03:25:03 [INFO] [xxx.swift::someFunc():5] Hello!
```

### Import once

If you don't want to `import` in each file, hold an instance of `Linna` in `AppDelegate.swift` or some global file.

```swift
let linna = Linna() // here

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
```

### Levels and Tags

You can classify logs with **levels** and **tags**.

**Levels** represents severity (e.g. `INFO`, `WARNING`, `ERROR`), and **tags** are user-defined words to classify the logs.

```swift
linna.out("No response", level: warning)
linna.out("Red button is tapped", tags: ["ButtonEvent"])
```

Output will be,

```text
2018/12/01 03:25:03 [WARNING] [xxx.swift::someFunc():5] No response
2018/12/01 03:25:03 [INFO] [xxx.swift::someFunc():6] Red button is tapped #ButtonEvent
```

### With a customized format

Heres are replaced attributes.

| Attribute | Replaced with | Example |
| -- | -- | -- |
| `%d` | date string | 2018/12/01 03:25:03 |
| `%obj` | objects | Hello! |
| `%level` | log level | INFO, ERROR |
| `%tags` | user-defined tags | #ButtonEvent |
| `%file` | file name | SampleViewController.swift |
| `%func` | function name | viewDidLoad() |
| `%line` | line number | 87 |

For instance,

```swift
linna.setFormatPattern(with: "%d %obj <%level> at %file:%line")
linna.out("Hello!")
```

the output will be,

```text
2018/12/01 03:25:03 Hello! <WARNING> at xxx.swift:5
```

### File output

To output to the local file, a file path **MUST** be set before calling output methods.

```swift
linna.setFileOutputPath(to: "tmp/hogetaro")
linna.out("Bye!")
```

A new file will be created if it doesn't exist.
If it exists, the log message will be appended to the existing file.

### Separate the output explicitly

To output solely to the debug console, call explicitly

```swift
Linna.cout("Console only")
```

or to output solely to the file,

```swift
linna.setFileOutputPath(to: "tmp/hogejiro")
linna.fout("File only")
```

Otherwise, you can define the streams to output through `Linna` class.

```swift
// Console only
linna.outputStreams = [.console]
// Console and file(default)
linna.outputStreams = [.console, .file]
```

## Debugging with Terminal

To check logs on the terminal, use some commands and supporting scripts.

For example,

```swift
linna.setFileOutputPath(to: "tmp/sample.log")
linna.out("Bye!")
```

then, output will be placed at `/tmp/`, so,

```sh
tail -F /tmp/sample.log | perl utils/highlight.pl
```

will show the log like the sample going on the top.

## Sample

The sample app for **Linna** is found in [LinnaSampleApp](https://github.com/Scior/Linna/tree/master/LinnaSampleApp).

## License

**Linna** is under MIT License.

Copyright (c) 2018 Suita Fujino  
