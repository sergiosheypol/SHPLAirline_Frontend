// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAllAirportsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAllAirports {
      airports {
        __typename
        iataCode
        name
        seoName
        countryCode
        regionCode
        cityCode
        currencyCode
      }
    }
    """

  public let operationName: String = "getAllAirports"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("airports", type: .list(.object(Airport.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(airports: [Airport?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "airports": airports.flatMap { (value: [Airport?]) -> [ResultMap?] in value.map { (value: Airport?) -> ResultMap? in value.flatMap { (value: Airport) -> ResultMap in value.resultMap } } }])
    }

    public var airports: [Airport?]? {
      get {
        return (resultMap["airports"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Airport?] in value.map { (value: ResultMap?) -> Airport? in value.flatMap { (value: ResultMap) -> Airport in Airport(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Airport?]) -> [ResultMap?] in value.map { (value: Airport?) -> ResultMap? in value.flatMap { (value: Airport) -> ResultMap in value.resultMap } } }, forKey: "airports")
      }
    }

    public struct Airport: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Airport"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("iataCode", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("seoName", type: .scalar(String.self)),
        GraphQLField("countryCode", type: .scalar(String.self)),
        GraphQLField("regionCode", type: .scalar(String.self)),
        GraphQLField("cityCode", type: .scalar(String.self)),
        GraphQLField("currencyCode", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(iataCode: String? = nil, name: String? = nil, seoName: String? = nil, countryCode: String? = nil, regionCode: String? = nil, cityCode: String? = nil, currencyCode: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Airport", "iataCode": iataCode, "name": name, "seoName": seoName, "countryCode": countryCode, "regionCode": regionCode, "cityCode": cityCode, "currencyCode": currencyCode])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var iataCode: String? {
        get {
          return resultMap["iataCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "iataCode")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var seoName: String? {
        get {
          return resultMap["seoName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "seoName")
        }
      }

      public var countryCode: String? {
        get {
          return resultMap["countryCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "countryCode")
        }
      }

      public var regionCode: String? {
        get {
          return resultMap["regionCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "regionCode")
        }
      }

      public var cityCode: String? {
        get {
          return resultMap["cityCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cityCode")
        }
      }

      public var currencyCode: String? {
        get {
          return resultMap["currencyCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currencyCode")
        }
      }
    }
  }
}

public final class GetAirportQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAirport($iataCode: String!) {
      airport(iataCode: $iataCode) {
        __typename
        name
        iataCode
        cityCode
        countryCode
      }
    }
    """

  public let operationName: String = "getAirport"

  public var iataCode: String

  public init(iataCode: String) {
    self.iataCode = iataCode
  }

  public var variables: GraphQLMap? {
    return ["iataCode": iataCode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("airport", arguments: ["iataCode": GraphQLVariable("iataCode")], type: .object(Airport.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(airport: Airport? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "airport": airport.flatMap { (value: Airport) -> ResultMap in value.resultMap }])
    }

    public var airport: Airport? {
      get {
        return (resultMap["airport"] as? ResultMap).flatMap { Airport(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "airport")
      }
    }

    public struct Airport: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Airport"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("iataCode", type: .scalar(String.self)),
        GraphQLField("cityCode", type: .scalar(String.self)),
        GraphQLField("countryCode", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, iataCode: String? = nil, cityCode: String? = nil, countryCode: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Airport", "name": name, "iataCode": iataCode, "cityCode": cityCode, "countryCode": countryCode])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var iataCode: String? {
        get {
          return resultMap["iataCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "iataCode")
        }
      }

      public var cityCode: String? {
        get {
          return resultMap["cityCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cityCode")
        }
      }

      public var countryCode: String? {
        get {
          return resultMap["countryCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "countryCode")
        }
      }
    }
  }
}
