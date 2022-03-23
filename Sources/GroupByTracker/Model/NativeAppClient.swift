// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nativeAppClient = try NativeAppClient(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// Contains data about the client sending the beacon when the client is a native app. This
/// is a generic submodel meant to be used for all types of native apps like Android and iOS.
// MARK: - NativeAppClient
public struct NativeAppClient: Codable, Hashable {
    /// The device user's language preference, expressed as a language code. Ex. "en-US".
    public let lang: String
    /// The model of the device. Ex. "Pixel 5" or "iOS".
    public let model: String
    /// The native app platform.
    public let platform: Platform

    public init(lang: String, model: String, platform: Platform) {
        self.lang = lang
        self.model = model
        self.platform = platform
    }
}

// MARK: NativeAppClient convenience initializers and mutators

public extension NativeAppClient {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(NativeAppClient.self, from: data)
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
        lang: String? = nil,
        model: String? = nil,
        platform: Platform? = nil
    ) -> NativeAppClient {
        return NativeAppClient(
            lang: lang ?? self.lang,
            model: model ?? self.model,
            platform: platform ?? self.platform
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
