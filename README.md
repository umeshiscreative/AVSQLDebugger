

# AVSQLDebugger
<p align="left">
    <img src="https://img.shields.io/badge/swift-5-brightgreen.svg" />
        <img src="https://img.shields.io/badge/Platforms-iOS-blue.svg?style=flat" />
    <a href="https://cocoapods.org/pods/AVSQLDebugger">
        <img src="https://img.shields.io/cocoapods/v/AVSQLDebugger.svg" alt="CocoaPods" />
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat" alt="Carthage" />
    </a>
    <a href="https://opensource.org/licenses/MIT">
      <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License" />
    </a>
</p>

# Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

# Usage
## 👩‍💻 How to use

You can use this as the follows:

```swift
import AVSQLDebugger
  
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

     //Initialize the Debugger in AppDelegate File with your container name and set your custom Port Number
        
     AVDebugger.sharedInstance.config(with: self, containerName: "Example", port: 8090)
        
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

## 📲Installation

#### Using [CocoaPods](https://cocoapods.org)
To install it, simply add the following line to your Podfile:

```ruby
pod 'AVSQLDebugger', '~>1.0.2'
```
Then Run

```ruby
pod install
```
#### Using [Carthage](https://github.com/carthage)

Edit your `Cartfile` and specify the dependency:

```bash
github "umeshiscreative/AVSQLDebugger"
```

## Author

Umesh Verma

## License

AVSQLDebugger is available under the MIT license. See the LICENSE file for more info.
