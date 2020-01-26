# MetaRod
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/komaji/GradientAnimationView/blob/master/LICENSE)

MetaRod is a lightweight url meta data parser library.


![e5b4c37582a718534d2e83ea48cea18c](https://user-images.githubusercontent.com/509448/72453120-f123cf00-3801-11ea-8947-a1540f91b27e.gif)

## Usage

```
 MetaRod().build("https://www.vagrantup.jp/entry/2020/01/08/012539").og(completion: { result in
  // Do what you want to do with your meta data.
 }) { error in
  // Error
 }
```
or 
```
 DispatchQueue.global().async {
    do {
      let result = try MetaRod().build("https://www.vagrantup.jp/entry/2020/01/08/012539").og()
      DispatchQueue.main.async {           
        // Do what you want to do with your meta data.                
      }
    } catch {
      // Error     
    }
 }
```

## Installation

### CocoaPods

MetaRod is available through CocoaPods. To install it, simply add the following line to your Podfile:

```
pod 'MetaRod'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager for Cocoa application.

``` bash
$ brew update
$ brew install carthage
```

To integrate MetaRod into your Xcode project using Carthage, specify it in your `Cartfile`:

``` ogdl
github "misyobun/MetaRod"
```

Then, run the following command to build the MetaRod framework:

``` bash
$ carthage update --platform iOS
```

MetaRod has dependency for `SwiftSoup.framework`, Carthage will automatically retrieve it for you. 
You will then have to drag it yourself into your project from the Carthage/Build folder.
Of course, don't forget to drag `MetaRod.framework` into your project.

(`Kingfisher.framework`,`KingfisherSwiftUI.framework` is for the sample project.)
