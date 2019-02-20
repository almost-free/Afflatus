# Afflatus

[![CI Status](https://img.shields.io/travis/jondwillis/Afflatus.svg?style=flat)](https://travis-ci.org/jondwillis/Afflatus)
[![Version](https://img.shields.io/cocoapods/v/Afflatus.svg?style=flat)](https://cocoapods.org/pods/Afflatus)
[![License](https://img.shields.io/cocoapods/l/Afflatus.svg?style=flat)](https://cocoapods.org/pods/Afflatus)
[![Platform](https://img.shields.io/cocoapods/p/Afflatus.svg?style=flat)](https://cocoapods.org/pods/Afflatus)

## Getting started

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Declare a (global) instance of MultiAnalyticsProvider

```swift
import Afflatus

let Afflatus: AnalyticsProvider = MultiAnalyticsProvider(providers: [
    FirebaseAnalyticsProvider(priority: 3), //requires GoogleServices.info
    FacebookAnalyticsProvider(priority: 2),
    AppsFlyerAnalyticsProvider(priority: 1, devKey: "YOUR_DEV_KEY", appId: "YOUR_APP_ID")
])
```

### Pass AppDelegate lifecycle events to your instance

See [Example/Afflatus/AppDelegate.swift](Example/Afflatus/AppDelegate.swift)

### Define your event

```swift
struct MemoryWarningEvent: AnalyticsEventConvertible {
    let name = "memory_warning"
    let count: UInt
}
```

### Track your event

```swift

...

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

    count += 1
    Afflatus.trackEvent(MemoryWarningEvent(count: count))
}
```

### Track user properties to qualify events

```swift
Afflatus.setUserId(UUID().uuidString) // your persistent database value in production
Afflatus.setUserProperty(name: "name", withValue: "Sandy")
```

## Requirements

Tested on Xcode 9.4.1, Swift 4, Cocoapods 1.5.3

## Installation

Afflatus is available through [CocoaPods](https://cocoapods.org), and is split into subspecs to avoid bloat from providers that you do not wish to integrate. To install
it, simply add the following line to your Podfile:

```ruby
pod 'Afflatus'
pod 'Afflatus/Firebase'
pod 'Afflatus/AppsFlyer'
pod 'Afflatus/Facebook'
```

## Contributing- adding a new provider

### Add an entry to Afflatus.podspec

```ruby
s.subspec 'AppsFlyer' do |appsflyer|
    appsflyer.source_files = 'Afflatus/AppsFlyer/**/*'
    appsflyer.dependency 'AppsFlyerFramework'
end
```

### Define a new AnalyticsProvider, implementing all protocol methods

See [Afflatus/AppsFlyer/AppsFlyerAnalyticsProvider](Afflatus/AppsFlyer/AppsFlyerAnalyticsProvider) for an example

### Add any tests to the Example project

Be sure to import the subspec in Example/Podfile, e.g.:

```ruby
pod 'Afflatus/Facebook', :path => '../'
```

and then `pod install`

## License

Afflatus is available under the MIT license. See the LICENSE file for more info.
