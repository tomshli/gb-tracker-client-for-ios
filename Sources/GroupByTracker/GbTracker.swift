import Foundation
import UIKit

public class GbTracker {
    public var clientId: String
    public var area: String
    public var urlPrefixOverride: String?
    
    private var customer: Customer
    private var shopperTracking: ShopperTracking
    private var nativeAppClient: NativeAppClient
    
    public init(clientId: String, area: String, login: Login = Login(loggedIn: false, username: nil), urlPrefixOverride: String? = nil) {
        self.clientId = clientId
        self.area = area
        self.urlPrefixOverride = urlPrefixOverride
        
        self.customer = Customer(area: self.clientId, id: self.area)
        self.shopperTracking = ShopperTracking(login: login, visitorID: UUID().uuidString)
        self.nativeAppClient = NativeAppClient(appId: Bundle.main.bundleIdentifier ?? "", lang: Locale.preferredLanguages[0], model: UIDevice.current.modelName, platform: Platform.ios)
    }
    
    public func sendAddToCartEvent(addToCartBeacon: AddToCartBeacon) -> String? {
        return (addToCartBeacon.event.googleAttributionToken ?? "*googleAttributionToken*") + " " + self.nativeAppClient.appId
    }
    
    public func setLogin(login: Login)
    {
        self.shopperTracking.login = login
    }
    
    public func getLogin() -> Login {
        return self.shopperTracking.login
    }
}
