# AVSQLDebugger

[![CI Status](https://img.shields.io/travis/umeshiscreative/AVSQLDebugger.svg?style=flat)](https://travis-ci.org/umeshiscreative/AVSQLDebugger)
[![Version](https://img.shields.io/cocoapods/v/AVSQLDebugger.svg?style=flat)](https://cocoapods.org/pods/AVSQLDebugger)
[![License](https://img.shields.io/cocoapods/l/AVSQLDebugger.svg?style=flat)](https://cocoapods.org/pods/AVSQLDebugger)
[![Platform](https://img.shields.io/cocoapods/p/AVSQLDebugger.svg?style=flat)](https://cocoapods.org/pods/AVSQLDebugger)

# Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

# Usage

You can use this as the follows:

```swift
import AVSQLDebugger
  
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

     //Initialize the Debugger in AppDelegate File with your container name and your Port Number
        
     AVDebugger.sharedInstance.config(with: self, containerName: "Example",port: 8090)
        
     return true
 }

```
And make sure confirmation of **AVDebuggerProtocol** Protocol
```swift
import AVSQLDebugger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AVDebuggerProtocol { ... }

```
### Check the console for Server Running of given Port. Open this Url in your Web Browser and See all the Data inside your app.
```bash
------------------------------------------------------
🎉 Server is up and running on port: 8090 🎉
🎉 Copy and paste this url to your local browser. 🎉
🚀🚀🚀
http://127.0.0.0:8090/index.html
🚀🚀🚀
------------------------------------------------------
```
### Stop Listening the server events
```swift
 func applicationWillTerminate(_ application: UIApplication) {
      // Called when the application is about to terminate. Save data if appropriate.
      // Saves changes in the application's managed object context before the application terminates.
      self.saveContext()
      
      //Stop Listening the server
      AVDebugger.sharedInstance.stopListingServer()
 }
```

## Requirements

## Installation

AVSQLDebugger is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AVSQLDebugger', '~>1.0.2'
```
```ruby
pod install
```

## Author

Umesh Verma, umeshiscreative@gmail.com

## License

AVSQLDebugger is available under the MIT license. See the LICENSE file for more info.
