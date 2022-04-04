# GroupBy Tracker Client for iOS

This is the iOS SDK used to send beacons to GroupBy.

## Add package using Swift Package Manager

Refer to <a href="https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app" target="_blank">Adding Package Dependencies to Your App</a> article from Apple

## Usage with Swift Package Manager

To import and use the tracker:

```swift
import GroupByTracker

// create the SDK instance
let tracker = GbTracker(customerId: "customer_id", area: "area")

// set the login data
tracker.setLogin(login: Login(loggedIn: true, username: "shopper@example.com"))

// create beacon
let atcBeacon = AddToCartBeacon(...)

// send beacon
tracker.sendAddToCartEvent(addToCartBeacon: atcBeacon) { error in
    guard error == nil else {
        guard let gbError = error as? GbError else {
            // unknown error
            ...
            return
        }
        
        switch gbError {
            case .error(let code, let errorDetails, let innerError):
                guard let errorDetails = errorDetails else {
                    // network or other error
                    ...
                    return
                }
                
                if (errorDetails.jsonSchemaValidationErrors.count > 0)
                {
                    ...
                }
                
                break
            }
        
        return
    }
}
```

## Options

The constructor for the tracker client has an optional parameter for providing options:

```swift
let tracker = GbTracker(customerId: "customer_id", area: "area", urlPrefixOverride: <some_url>) // Optional, overrides the URL the beacon is sent to. Useful for testing.
```

## Set Login Information

The login data comes from the constructor call (allowing the SDK user to say “the shopper is logged in and this is their username” as they create the SDK instance) and also a method exist on the SDK instance that the user can call at any point during the app’s lifecycle to set new login data. This is to enable the use case of someone being not logged in at first, as they launch the app, but then logging it at some point while they’re using the app.

```swift
let tracker = GbTracker(customerId: "customer_id", area: "area", login: Login(loggedIn: true, username: "shopper@example.com"))

// or
let tracker = GbTracker(customerId: "customer_id", area: "area")
...
tracker.setLogin(login: Login(loggedIn: true, username: "shopper@example.com"))
```

## Shopper tracking

The defaults value for key `com.groupby.tracker.uuid.value` is set with an expiry time of 1 year that is extended each time the shopper visits again. This is used to anonymously track the shopper. This defaults is stored in UserDefaults.standard.

## More Usage Details

See the docs for more detailed information about implementing beacons:

https://docs.groupbycloud.com/gb-docs/gb-implementation/beacons/overview
