// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let orderBeacon = try OrderBeacon(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// An order event for the native app client type (as opposed to other client types like web
/// browsers) sent directly from the client (as opposed to sent from a server serving the
/// client). This event is used when the shopper adds a product to their cart. Note that the
/// only client officially supported for sending GroupBy this data is the official GroupBy
/// native app SDK for the respective platform (Android, iOS, etc). A backwards incompatible
/// change may be made to a major version of this schema if the change would not be backwards
/// incompatible with respect to correct usage of the corresponding major version of the
/// native app SDK.
// MARK: - OrderBeacon
public struct OrderBeacon: Codable, Hashable {
    public let client: NativeAppClient
    public let customer: Customer
    public let event: OrderEvent
    public let experiments: [Experiments]?
    public let metadata: [Metadata]?
    public let shopper: ShopperTracking
    public let time: Date

    public init(client: NativeAppClient, customer: Customer, event: OrderEvent, experiments: [Experiments]?, metadata: [Metadata]?, shopper: ShopperTracking, time: Date) {
        self.client = client
        self.customer = customer
        self.event = event
        self.experiments = experiments
        self.metadata = metadata
        self.shopper = shopper
        self.time = time
    }
}

// MARK: OrderBeacon convenience initializers and mutators

public extension OrderBeacon {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(OrderBeacon.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        client: NativeAppClient? = nil,
        customer: Customer? = nil,
        event: OrderEvent? = nil,
        experiments: [Experiments]?? = nil,
        metadata: [Metadata]?? = nil,
        shopper: ShopperTracking? = nil,
        time: Date? = nil
    ) -> OrderBeacon {
        return OrderBeacon(
            client: client ?? self.client,
            customer: customer ?? self.customer,
            event: event ?? self.event,
            experiments: experiments ?? self.experiments,
            metadata: metadata ?? self.metadata,
            shopper: shopper ?? self.shopper,
            time: time ?? self.time
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
