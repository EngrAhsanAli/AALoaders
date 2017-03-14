# Table of Contents

- [AALoaders](#section-id-4)
  - [Description](#section-id-10)
  - [Demonstration](#section-id-16)
  - [Requirements](#section-id-26)
- [Installation](#section-id-32)
  - [CocoaPods](#section-id-37)
  - [Carthage](#section-id-63)
  - [Manual Installation](#section-id-82)
- [Getting Started](#section-id-87)
  - [AANavigationLoader](#section-id-90)
  - [AAButtonLoader](#section-id-104)
  - [AAImageLoader](#section-id-112)
  - [AADialogLoader](#section-id-132)
- [Contributions & License](#section-id-156)


<div id='section-id-4'/>

#AALoaders

[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](https://img.shields.io/cocoapods/v/AALoaders.svg)](http://cocoadocs.org/docsets/AALoaders) [![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/EngrAhsanAli/AALoaders.svg?branch=master)](https://travis-ci.org/EngrAhsanAli/AALoaders) 
![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg) [![CocoaPods](https://img.shields.io/cocoapods/p/AALoaders.svg)]()


<div id='section-id-10'/>

##Description


AALoaders is a lightweight, easy-to-use and powerful progress view loaders framework, written in Swift. It uses simple native elements for progress loading with customisations and allow to use without creating instance.

![](https://github.com/EngrAhsanAli/AALoaders/blob/master/Screenshots/Home.png)

<div id='section-id-16'/>

##Demonstration


It includes four type of loading views as follows:

- [AANavigationLoader](#section-id-90)
- [AAButtonLoader](#section-id-104)
- [AAImageLoader](#section-id-112)
- [AADialogLoader](#section-id-132)


To run the example project, clone the repo, and run `pod install` from the Example directory first.


<div id='section-id-26'/>

##Requirements

- iOS 8.0+
- Xcode 8.0+
- Swift 3+

<div id='section-id-32'/>

# Installation

`AALoaders` can be installed using CocoaPods, Carthage, or manually.


<div id='section-id-37'/>

##CocoaPods

`AALoaders` is available through [CocoaPods](http://cocoapods.org). To install CocoaPods, run:

`$ gem install cocoapods`

Then create a Podfile with the following contents:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
pod 'AALoaders'
end

```

Finally, run the following command to install it:
```
$ pod install
```



<div id='section-id-63'/>

##Carthage

To install Carthage, run (using Homebrew):
```
$ brew update
$ brew install carthage
```
Then add the following line to your Cartfile:

```
github "EngrAhsanAli/AALoaders" "master"
```

Then import the library in all files where you use it:
```swift
import AALoaders
```


<div id='section-id-82'/>

##Manual Installation

If you prefer not to use either of the above mentioned dependency managers, you can integrate `AALoaders` into your project manually by adding the files contained in the Classes folder to your project.


<div id='section-id-87'/>

#Getting Started
----------

<div id='section-id-90'/>

##AANavigationLoader

`AANavigationLoader` is basically `UIProgressView` bar loading in `UINavigationController` with options for customization.

![](https://github.com/EngrAhsanAli/AALoaders/blob/master/Screenshots/AANavigationLoader.gif)

`AANavigationOptions` can be configured using following types:


|  AANavigationOptions	 |  Types		  | Description                              |
|------------------------|----------------|------------------------------------------|
| `maxProgress`          | `Float`        | Max progress value allowed for animation |
| `barHeight`            | `CGFloat`      | UIProgressView bar height (1.0 to 5.0)   |
| `barProgressColor`     | `UIColor`      | UIProgressView bar progress color        |
| `barBackgroundColor`   | `UIColor`      | UIProgressView bar tracking color        |
| `progressStep`         | `Float`        | Progress animation step (0.05 to 0.0025) |


**Usage**:
```swift
let options = AANavigationOptions()
// Configure options
//
//
//

// Show loader with options
self.navigationController?.aa_showLoader(options)
// Show loader without options
self.navigationController?.aa_showLoader()
// Cancel loader
self.navigationController?.aa_hideLoader(true)
// Complete loader
self.navigationController?.aa_hideLoader(false)
```


<div id='section-id-104'/>

##AAButtonLoader

`AAButtonLoader` is basically `UIActivityIndicatorView` loading in `UIButton` with options for customization.

![](https://github.com/EngrAhsanAli/AALoaders/blob/master/Screenshots/AAButtonLoader.gif)

`AAButtonOptions` can be configured using following types:

|  AAButtonOptions	 |  Types           | Description                             |
|--------------------|------------------|-----------------------------------------|
| `color`            | `UIColor?`        | Activity indicator color                |
| `position`         | `LoaderPosition?` | Activity indicator position in UIButton |


`LoaderPosition` has following types:

- left
- right
- before
- after
- middle

**Usage**:
```swift
let options = AAButtonOptions()
// Configure options
//
//
//

// Toggle loader with options
self.button.aa_toggleLoader(options)
// Toggle loader without options
self.button.aa_toggleLoader()
```


<div id='section-id-112'/>

##AAImageLoader

`AAImageLoader` is basically `UIActivityIndicatorView` loading with downloading from given HTTP URL in `UIImageView` with options for customization.

![](https://github.com/EngrAhsanAli/AALoaders/blob/master/Screenshots/AAImageLoader.gif)

`AAImageOptions` can be configured using following types:

|  AAImageOptions	 |  Types           | Description                             |
|--------------------|------------------|-----------------------------------------|
| `color`            | `UIColor`        | Activity indicator color                |

**Usage**:
```swift
let options = AAImageOptions()
// Configure options
//
//
//

// Set image with options
self.imageView.aa_setImage(string: <URL_HERE>, withOptions: options)
// Set image without options
self.imageView.aa_setImage(string: <URL_HERE>)
```

<div id='section-id-132'/>

##AADialogLoader

`AADialogLoader` is basically `UIActivityIndicatorView` loading with title and message in `UIAlertController` and options for customization.

![](https://github.com/EngrAhsanAli/AALoaders/blob/master/Screenshots/AADialogLoader.gif)

`AADialogOptions` can be configured using following types:

|  AADialogOptions	 |  Types                     | Description               |
|--------------------|----------------------------|---------------------------|
| `title`            | `String?`                  | Title string              |
| `message`          | `String?`                  | Message string            |
| `titleAttributes`  | `Dictionary<String, Any>?` | Title attributes          |
| `messageAttributes`| `Dictionary<String, Any>?` | Message attributes        |
| `loaderColor`      | `UIColor?`                 | Activity indicator color  |
| `cancelColor`      | `UIColor?`                 | Cancel button color       |
| `cornerRadius`     | `CGFloat?`                 | Corner radius             |
| `borderWidth`      | `CGFloat?`                 | Border width              |
| `borderColor`      | `UIColor?`                 | Border color              |
| `shadowColor`      | `UIColor?`                 | Shadow color              |
| `blurEffect`       | `UIBlurEffectStyle?`       | UIBlurEffectStyle style   |
| `backgroundColor`  | `UIColor?`                 | Background color          |


**Usage**:
```swift
let options = AADialogOptions()
// Configure options
//
//
//

// Show dialog with options
self.aa_showLoader(deadline: dismissTime, options: options, withCancel: "Cancel")
// Show dialog without options
self.aa_showLoader(deadline: dismissTime)
// Show dialog without deadline
self.aa_showLoader()

```


<div id='section-id-156'/>

#Contributions & License

`AALoaders` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

Pull requests are welcome! The best contributions will consist of substitutions or configurations for classes/methods known to block the main thread during a typical app lifecycle.

I would love to know if you are using `AALoaders` in your app, send an email to [Engr. Ahsan Ali](mailto:hafiz.m.ahsan.ali@gmail.com)

