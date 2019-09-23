

# AVSQLDebugger
A Simple extension that will debug your Core Data inside iOS apps. Just use this extension and debug your database in your web browser.

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

### Check the console for server running of given port. Open this url in your web browser and see all the data inside your app.

```bash
------------------------------------------------------
🎉 Server is up and running on port: 8090 🎉
🎉 Copy and paste this url to your local browser. 🎉
🚀🚀🚀
http://127.0.0.0:8090/index.html
🚀🚀🚀
------------------------------------------------------
```

### Stop listening the server events

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


## ❤️ Contributing

This is an open source project, so feel free to contribute. How?
- Open an [issue](https://github.com/umeshiscreative/AVSQLDebugger/issues/new).
- Propose your own fixes, suggestions and open a pull request with the changes.

## Author

Umesh Verma

## License

AVSQLDebugger is available under the MIT license. See the LICENSE file for more info.
