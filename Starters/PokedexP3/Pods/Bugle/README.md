# Bugle

[![Version](https://img.shields.io/cocoapods/v/Bugle.svg?style=flat)](http://cocoapods.org/pods/Bugle)
[![License](https://img.shields.io/cocoapods/l/Bugle.svg?style=flat)](http://cocoapods.org/pods/Bugle)
[![Platform](https://img.shields.io/cocoapods/p/Bugle.svg?style=flat)](http://cocoapods.org/pods/Bugle)

Bugle, is a helper for displaying alerts without writing boilerplate code.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Swift and Objective-C Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To give `Bugle` a try with an example project, run the following command:

```bash
$ pod try Bugle
```

To integrate `Bugle` into your Xcode project, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

target 'MyApp' do
    pod 'Bugle'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

In your `application:didFinishLaunchingWithOptions: method`, setup the  `shared` instance of `Bugle`:

```swift
Bugle.setup(with: options)
```

Where `options` is a configuration struct:

```swift
extension AppDelegate {
    fileprivate var options: BugleOptions {
        return [
            //.tint: UIColor.green,
            .cancel: "No",
            .title: "Bugle App Delegate title!",
            .action: "Understood",
            //.errorTint: UIColor.yellow
        ]
    }
}
```

See the [properties](#properties) section for more information about `BugleOptions` keys and values.

Also, If you want to liste to actions on the dialog just add the `BugleDelegate`:

```swift
extension ViewController: BugleDelegate {
    func didConfirm() {
        debugPrint("Confirm bugle")
    }

    // This method is optional
    func didCancel() {
        //TODO: Do something
    }
}
```

Then:

```swift
Bugle.shared.play("Hello World", on: self)
```

or you can override some setup:

```swift
let options: BugleOptions = [
    .cancel: "No, forget it",
    .title: "Are you sure?",
    .action:  "Yes, I'm a savage",
]
Bugle.shared.play("Push to master", options, on: self, ofType: .risky)
```

## Properties

| Property | Type | Required |
| --- | --- | --- |
| title | String | :white_check_mark:
| action | String | :white_check_mark:
| cancel | String | :white_check_mark:
| tint | UIColor | :x:
| errorTint | UIColor | :x:

## Contributors

* [Luis Burgos](https://github.com/LuisBurgos/) - luisarturo.burgos@gmail.com
* [María Patrón](https://github.com/maj24/) - mariajose.patron@gmail.com

## License

Bugle is released under the MIT license. See [LICENSE](https://github.com/nmdias/DefaultsKit/blob/master/LICENSE) for details.
