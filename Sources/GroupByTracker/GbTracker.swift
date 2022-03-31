import Foundation
import UIKit

public class GbTracker {
    public var customerId: String
    public var area: String
    public var urlPrefixOverride: String?
    
    private var customer: Customer
    private var shopperTracking: ShopperTracking
    private var nativeAppClient: NativeAppClient
    
    public init(customerId: String, area: String, login: Login = Login(loggedIn: false, username: nil), urlPrefixOverride: String? = nil) {
        self.customerId = customerId
        self.area = area
        self.urlPrefixOverride = urlPrefixOverride
        
        if (urlPrefixOverride == nil)
        {
            gbAPI.basePath = String(format: gbAPI.basePath, self.customerId)
        }
        else
        {
            gbAPI.basePath = self.urlPrefixOverride!
        }
        
        self.customer = Customer(area: self.customerId, id: self.area)
        self.nativeAppClient = NativeAppClient(appId: Bundle.main.bundleIdentifier ?? "", lang: Locale.preferredLanguages[0], model: UIDevice.current.modelName, platform: Platform.ios)
        
        var uuid = ""
        let userDefaults = UserDefaults.standard
        let uuidExpiration = userDefaults.double(forKey: "com.groupby.tracker.uuid.expiration")
        let currentTime = Date().timeIntervalSince1970 * 1000
        if (currentTime < uuidExpiration)
        {
            uuid = userDefaults.string(forKey: "com.groupby.tracker.uuid.value") ?? ""
        }
        
        if (uuid == "")
        {
            uuid = UUID().uuidString
            
            userDefaults.set(uuid, forKey: "com.groupby.tracker.uuid.value")
            
            let now = Date()
            let cal = Calendar(identifier: .gregorian)
            let nextYear = cal.date(byAdding: .year, value: 1, to: now)!
            let nextYearTime = nextYear.timeIntervalSince1970 * 1000
            userDefaults.set(nextYearTime, forKey: "com.groupby.tracker.uuid.expiration")
        }
        self.shopperTracking = ShopperTracking(login: login, visitorID: uuid)
    }
    
    public func sendAddToCartEvent(addToCartBeacon: AddToCartBeacon, completion: @escaping ((_ data: String?, _ error: Error?) -> Void)) {
        addToCartBeacon.customer = self.customer
        addToCartBeacon.client = self.nativeAppClient
        addToCartBeacon.shopper = self.shopperTracking
        addToCartBeacon.time = Date()
        GroupByAPI.addToCartPost(addToCartBeacon: addToCartBeacon, completion: completion)
        renewUUIDExpiration()
    }
    
    private func renewUUIDExpiration() {
        let userDefaults = UserDefaults.standard
        let now = Date()
        let cal = Calendar(identifier: .gregorian)
        let nextYear = cal.date(byAdding: .year, value: 1, to: now)!
        let nextYearTime = nextYear.timeIntervalSince1970 * 1000
        userDefaults.set(nextYearTime, forKey: "com.groupby.tracker.uuid.expiration")
    }
    
    public func setLogin(login: Login)
    {
        self.shopperTracking.login = login
    }
    
    public func getLogin() -> Login {
        return self.shopperTracking.login
    }
}
