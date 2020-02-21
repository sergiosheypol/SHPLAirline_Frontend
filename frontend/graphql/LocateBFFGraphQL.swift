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

public final class GetAutocompleteQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAutocomplete($phrase: String) {
      autocomplete(phrase: $phrase) {
        __typename
        code
        city {
          __typename
          code
          name
          countryCode
        }
        country {
          __typename
          code
          name
          currency
          defaultAirportCode
        }
        coordinates {
          __typename
          latitude
          longitude
        }
      }
    }
    """

  public let operationName: String = "getAutocomplete"

  public var phrase: String?

  public init(phrase: String? = nil) {
    self.phrase = phrase
  }

  public var variables: GraphQLMap? {
    return ["phrase": phrase]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("autocomplete", arguments: ["phrase": GraphQLVariable("phrase")], type: .list(.object(Autocomplete.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(autocomplete: [Autocomplete?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "autocomplete": autocomplete.flatMap { (value: [Autocomplete?]) -> [ResultMap?] in value.map { (value: Autocomplete?) -> ResultMap? in value.flatMap { (value: Autocomplete) -> ResultMap in value.resultMap } } }])
    }

    public var autocomplete: [Autocomplete?]? {
      get {
        return (resultMap["autocomplete"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Autocomplete?] in value.map { (value: ResultMap?) -> Autocomplete? in value.flatMap { (value: ResultMap) -> Autocomplete in Autocomplete(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Autocomplete?]) -> [ResultMap?] in value.map { (value: Autocomplete?) -> ResultMap? in value.flatMap { (value: Autocomplete) -> ResultMap in value.resultMap } } }, forKey: "autocomplete")
      }
    }

    public struct Autocomplete: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Autocomplete"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("code", type: .scalar(String.self)),
        GraphQLField("city", type: .object(City.selections)),
        GraphQLField("country", type: .object(Country.selections)),
        GraphQLField("coordinates", type: .object(Coordinate.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(code: String? = nil, city: City? = nil, country: Country? = nil, coordinates: Coordinate? = nil) {
        self.init(unsafeResultMap: ["__typename": "Autocomplete", "code": code, "city": city.flatMap { (value: City) -> ResultMap in value.resultMap }, "country": country.flatMap { (value: Country) -> ResultMap in value.resultMap }, "coordinates": coordinates.flatMap { (value: Coordinate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var code: String? {
        get {
          return resultMap["code"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "code")
        }
      }

      public var city: City? {
        get {
          return (resultMap["city"] as? ResultMap).flatMap { City(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "city")
        }
      }

      public var country: Country? {
        get {
          return (resultMap["country"] as? ResultMap).flatMap { Country(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "country")
        }
      }

      public var coordinates: Coordinate? {
        get {
          return (resultMap["coordinates"] as? ResultMap).flatMap { Coordinate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "coordinates")
        }
      }

      public struct City: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["City"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("code", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("countryCode", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: String? = nil, name: String? = nil, countryCode: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "City", "code": code, "name": name, "countryCode": countryCode])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: String? {
          get {
            return resultMap["code"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
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

        public var countryCode: String? {
          get {
            return resultMap["countryCode"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "countryCode")
          }
        }
      }

      public struct Country: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Country"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("code", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("currency", type: .scalar(String.self)),
          GraphQLField("defaultAirportCode", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: String? = nil, name: String? = nil, currency: String? = nil, defaultAirportCode: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Country", "code": code, "name": name, "currency": currency, "defaultAirportCode": defaultAirportCode])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: String? {
          get {
            return resultMap["code"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
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

        public var currency: String? {
          get {
            return resultMap["currency"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "currency")
          }
        }

        public var defaultAirportCode: String? {
          get {
            return resultMap["defaultAirportCode"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "defaultAirportCode")
          }
        }
      }

      public struct Coordinate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Coordinates"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("latitude", type: .scalar(String.self)),
          GraphQLField("longitude", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(latitude: String? = nil, longitude: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Coordinates", "latitude": latitude, "longitude": longitude])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var latitude: String? {
          get {
            return resultMap["latitude"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "latitude")
          }
        }

        public var longitude: String? {
          get {
            return resultMap["longitude"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "longitude")
          }
        }
      }
    }
  }
}
