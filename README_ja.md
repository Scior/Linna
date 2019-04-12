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

## What's this?

**Linna**は、Swift製のシンプルなインターフェースを持つデバッグロガーです。

![Linna Sample](https://gist.githubusercontent.com/Scior/c601461a06a384e0f534b045d29b6272/raw/2b6c0ef488bf17fa38f9980ae2c77083ca795a6b/linnasample.gif)

## Feature

- カスタム可能なフォーマット
- ファイル出力対応
- タグによる分類

## Installation

### Carthageでのインストール

- `Cartfile`に以下の行を追加します。

```ruby
github "Scior/Linna"
```

- ルートディレクトリで、`carthage update`を実行します。

- プロジェクトに`Linna.framework`を追加します。

## Usage

### クイックスタート

**Linna**をインポートして、`shared`インスタンスを使ってメソッドを呼び出します。

```swift
import Linna

func someFunc() {
    // Sample for the console output with the default format
    Linna.shared.out("Hello!")
}
```

出力は以下のようになります。

```text
2018/12/01 03:25:03 [INFO] [xxx.swift::someFunc():5] Hello!
```

### 複数箇所で使用したい場合

何度もインポートしたくない場合は、`AppDelegate.swift`などのグローバルスコープでインスタンスを持ちます。

```swift
let linna = Linna()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
```

### レベルとタグ

ログは**レベル**と**タグ**で分類できます。

**レベル**はそのログの重要度を表します(`INFO`, `WARNING`, `ERROR`など)。  
**タグ**はユーザーが定義する分類用の文字列です。

```swift
linna.out("No response", level: warning)
linna.out("Red button is tapped", tags: ["ButtonEvent"])
```

この場合出力は次のようになります。

```text
2018/12/01 03:25:03 [WARNING] [xxx.swift::someFunc():5] No response
2018/12/01 03:25:03 [INFO] [xxx.swift::someFunc():6] Red button is tapped #ButtonEvent
```

### フォーマットをカスタマイズする

利用可能なパラメーターは以下のようになります。

| パラメーター | 内容 | 例 |
| -- | -- | -- |
| `%d` | 日時 | 2018/12/01 03:25:03 |
| `%obj` | オブジェクト | Hello! |
| `%level` | ログレベル | INFO, ERROR |
| `%tags` | タグ | #ButtonEvent |
| `%file` | ファイル名 | SampleViewController.swift |
| `%func` | メソッド名 | viewDidLoad() |
| `%line` | 行番号 | 87 |

フォーマットパターンは、以下のメソッドでセットします。

```swift
linna.setFormatPattern(with: "%d %obj <%level> at %file:%line")
linna.out("Hello!")
```

出力はこのようになります。

```text
2018/12/01 03:25:03 Hello! <WARNING> at xxx.swift:5
```

### ファイル出力

ファイル出力をする際は、パスを指定する必要があります。

```swift
Linna.setFileOutputPath(to: "tmp/hogetaro")
Linna.out("Bye!")
```

ファイルがすでに存在する場合は、追記されます。  
存在しない場合は作成されます。

### 出力を明示的に分ける

コンソール出力のみしたい場合は、

```swift
Linna.cout("Console only")
```

もしくは、ファイル出力のみしたい場合は、

```swift
Linna.setFileOutputPath(to: "tmp/hogejiro")
Linna.fout("File only")
```

のように、明示的なメソッドも用意されています。  
標準の出力ストリームは、以下のようにセットできます。

```swift
// Console only
Linna.outputStreams = [.console]
// Console and file
Linna.outputStreams = [.console, .file]
```

## ターミナルでログを確認する

ターミナルでログを確認する際は、通常のシェルコマンドと補助スクリプトを利用できます。

```swift
linna.setFileOutputPath(to: "tmp/sample.log")
linna.out("Bye!")
```

この場合`/tmp/`にログが出力されるので、

```sh
tail -F /tmp/sample.log | perl utils/highlight.pl
```

このようにすると、一番上のGIF画像のようになります。

## Sample

サンプルアプリはこちらにあります。  
- [LinnaSampleApp](https://github.com/Scior/Linna/tree/master/LinnaSampleApp)

## License

**Linna**は、MIT Licenseで提供しています。

Copyright (c) 2018 Suita Fujino  
