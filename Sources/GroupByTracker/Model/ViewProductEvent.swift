// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let viewProductEvent = try ViewProductEvent(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// The event data for a viewProduct event.
// MARK: - ViewProductEvent
public struct ViewProductEvent: Codable, Hashable {
    public let googleAttributionToken: String?
    public let product: Product

    public init(googleAttributionToken: String?, product: Product) {
        self.googleAttributionToken = googleAttributionToken
        self.product = product
    }
}

// MARK: ViewProductEvent convenience initializers and mutators

public extension ViewProductEvent {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ViewProductEvent.self, from: data)
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
        googleAttributionToken: String?? = nil,
        product: Product? = nil
    ) -> ViewProductEvent {
        return ViewProductEvent(
            googleAttributionToken: googleAttributionToken ?? self.googleAttributionToken,
            product: product ?? self.product
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
