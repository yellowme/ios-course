# Project: CocoaPods

Final code related: [Projects/CocoaPods](/Projects/CocoaPods)

## Requirements

**You must open** the module [Starter](/Starters/CocoaPods)

Install [cocoapods](https://cocoapods.org/), executing.

```bash
 sudo gem install cocoapods
```

*Note:* Verify the version is `1.5.3`

## What you learn

* Use CocoaPods
* Learn about Podfile
* Learn about Workspaces when working with *pods*

## Create the project

Create a new Xcode project and call it `CocoaPods`.

## Init CocoaPods

Quit the Xcode using `CMD + Q`. Go to the main folder of your project and execute:

```bash
pod init
```

This will create a Podfile document. Now, you need to execute:

```bash
pod install
```

Finally you should go to your Finder and open the `CocoaPods.workspace`.

**Important:** From now on you must only open `CocoaPods.workspace` in order for the dependencies to load and work properly.

![Workspace](/Assets/PJ-05-01.png)

## Install a Dependency

### 1. Open your Podfile and add `Bugle` as dependency

*Note:* Refer to [Bugle](https://github.com/yellowme/Bugle) repo.

Your Podfile should look like this:

```swift
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CocoaPods' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CocoaPods
  pod 'Bugle'

end
```

### 2. Install new dependencies

To install new dependencies execute:

```bash
pod install
```

### 3. Clean and build

Just to be sure, you must *clean* and *build* the project, before running the app.

## Use the third party library

Go to [Bugle](https://github.com/yellowme/Bugle) repository and implement the method `didTapMainAction` using this third party library.