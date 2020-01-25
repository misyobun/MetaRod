# MetaRod
MetaRod is a lightweight url meta data parser library.


![e5b4c37582a718534d2e83ea48cea18c](https://user-images.githubusercontent.com/509448/72453120-f123cf00-3801-11ea-8947-a1540f91b27e.gif)

## Installation
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
