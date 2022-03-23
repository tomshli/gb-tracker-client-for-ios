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
        self.shopperTracking = ShopperTracking(login: login, visitorID: UUID().uuidString)
        self.nativeAppClient = NativeAppClient(appId: Bundle.main.bundleIdentifier ?? "", lang: Locale.preferredLanguages[0], model: UIDevice.current.modelName, platform: Platform.ios)
    }
    
    public func sendAddToCartEvent(addToCartBeacon: AddToCartBeacon, completion: @escaping ((_ data: String?, _ error: Error?) -> Void)) {
        addToCartBeacon.customer = self.customer
        addToCartBeacon.client = self.nativeAppClient
        addToCartBeacon.shopper = self.shopperTracking
        addToCartBeacon.time = Date()
        return GroupByAPI.addToCartPost(addToCartBeacon: addToCartBeacon, completion: completion)
    }
    
    public func setLogin(login: Login)
    {
        self.shopperTracking.login = login
    }
    
    public func getLogin() -> Login {
        return self.shopperTracking.login
    }
}
