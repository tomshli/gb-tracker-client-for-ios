//
// GroupByAPI.swift
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

class GroupByAPI {
    /**
     - Send addToCart POST request
     - parameter addToCartBeacon: (body) beacon (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addToCartPost(addToCartBeacon: AddToCartBeacon? = nil, apiResponseQueue: DispatchQueue = gbAPI.apiResponseQueue, completion: @escaping ((_ error: Error?) -> Void)) {
        addToCartPostWithRequestBuilder(addToCartBeacon: addToCartBeacon).execute(apiResponseQueue) { result in
            switch result {
            case .success(_):
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }

    /**
     Send addToCart POST request
     - POST /addToCart
     - Send addToCart POST request
     - parameter addToCartBeacon: (body) beacon (optional)
     - returns: RequestBuilder<String>
     */
    open class func addToCartPostWithRequestBuilder(addToCartBeacon: AddToCartBeacon? = nil) -> RequestBuilder<Void> {
        let localVariablePath = "/addToCart"
        let localVariableURLString = gbAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: addToCartBeacon)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = gbAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
    
    /**
     - Send autoSearch POST request
     - parameter autoSearchBeacon: (body) beacon (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func autoSearchPost(autoSearchBeacon: AutoSearchBeacon? = nil, apiResponseQueue: DispatchQueue = gbAPI.apiResponseQueue, completion: @escaping ((_ error: Error?) -> Void)) {
        autoSearchPostWithRequestBuilder(autoSearchBeacon: autoSearchBeacon).execute(apiResponseQueue) { result in
            switch result {
            case .success(_):
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }

    /**
     Send autoSearch POST request
     - POST /autoSearch
     - Send autoSearch POST request
     - parameter autoSearchBeacon: (body) beacon (optional)
     - returns: RequestBuilder<String>
     */
    open class func autoSearchPostWithRequestBuilder(autoSearchBeacon: AutoSearchBeacon? = nil) -> RequestBuilder<Void> {
        let localVariablePath = "/autoSearch"
        let localVariableURLString = gbAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: autoSearchBeacon)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = gbAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
